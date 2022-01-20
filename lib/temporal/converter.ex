defmodule Temporal.Converter do
  alias Temporal.Api.Common.V1.Payload

  @moduledoc """
  Converter behavior. All implementations must implement encode and decode. The
  default converter, Temporal.Converter.Default, is the most commonly used
  converter.

  ## Examples

  By default, types are converted to JSON:

      iex> val = %{foo: "bar"}
      iex> {:ok, payload} = Temporal.Converter.Default.encode(val)
      {:ok, %#{Payload}{data: ~s({"foo":"bar"}), metadata: %{"encoding" => "json/plain"}}}
      iex> Temporal.Converter.Default.decode(payload)
      {:ok, %{"foo" => "bar"}}

  Same for scalars:

      iex> Temporal.Converter.Default.encode(123)
      {:ok, %#{Payload}{data: "123", metadata: %{"encoding" => "json/plain"}}}
      iex> Temporal.Converter.Default.encode("some string")
      {:ok, %#{Payload}{data: ~s("some string"), metadata: %{"encoding" => "json/plain"}}}

  For protos, if we don't have known message types, it'll decode to a ref:

      iex> proto = Temporal.Api.Common.V1.WorkflowType.new!(name: "some name")
      iex> {:ok, payload} = Temporal.Converter.Default.encode(proto)
      iex> {:ok, %Temporal.Converter.ProtoJSONRef{json: json}} = Temporal.Converter.Default.decode(payload)
      iex> json
      ~s({"name":"some name"})

  """

  @type t :: module

  @callback encode(any, []) ::
              {:ok, Payload.t()}
              | {:error, :not_supported}
              | {:error, String.t()}

  @callback decode(Payload.t(), []) :: {:ok, any} | {:error, String.t()}

  def new_payload(encoding, data, metadata \\ %{}) do
    Payload.new!(metadata: Map.put(metadata, "encoding", to_string(encoding)), data: data)
  end

  def encode_composite(v, converters, opts) do
    Enum.reduce_while(converters, {:error, :not_supported}, fn {_, converter}, acc ->
      case converter.encode(v, opts) do
        # Only continue when not supported
        {:error, :not_supported} -> {:cont, acc}
        ok_or_error -> {:halt, ok_or_error}
      end
    end)
  end

  def decode_composite(v, converters, opts) do
    payload_encoding = String.to_existing_atom(v.metadata["encoding"])

    Enum.reduce_while(converters, {:error, :not_supported}, fn {encoding, converter}, acc ->
      if encoding != payload_encoding do
        {:cont, acc}
      else
        case converter.decode(v, opts) do
          # Only continue when not supported
          {:error, :not_supported} -> {:cont, acc}
          ok_or_error -> {:halt, ok_or_error}
        end
      end
    end)
  end
end

defmodule Temporal.Converter.Default do
  @behaviour Temporal.Converter

  @converters [
    # Order is important
    "binary/null": Temporal.Converter.BinaryNull,
    "binary/plain": Temporal.Converter.BinaryPlain,
    "json/protobuf": Temporal.Converter.ProtoJSON,
    "binary/protobuf": Temporal.Converter.ProtoBinary,
    "json/plain": Temporal.Converter.JSON
  ]

  def converters(), do: @converters

  @impl true
  def encode(v, opts \\ []), do: Temporal.Converter.encode_composite(v, @converters, opts)

  @impl true
  def decode(v, opts \\ []), do: Temporal.Converter.decode_composite(v, @converters, opts)
end

defmodule Temporal.Converter.BinaryNull do
  @behaviour Temporal.Converter

  @impl true
  def encode(v, _ \\ []) do
    if is_nil(v) do
      {:ok, Temporal.Converter.new_payload(:"binary/null", "")}
    else
      {:error, :not_supported}
    end
  end

  @impl true
  def decode(_, _ \\ []), do: {:ok, nil}
end

defmodule Temporal.Converter.BinaryPlain do
  @behaviour Temporal.Converter

  @impl true
  def encode(_, _ \\ []) do
    # There is no concept of a byte array here
    {:error, :not_supported}
  end

  @impl true
  def decode(v, _ \\ []), do: {:ok, v.data}
end

defmodule Temporal.Converter.ProtoJSONRef do
  @enforce_keys [:json]
  defstruct [:json, message_type: nil]
end

defmodule Temporal.Converter.ProtoJSON do
  @behaviour Temporal.Converter

  @impl true
  def encode(v, _ \\ []) do
    if Temporal.Utility.is_proto(v) do
      # TODO(cretz): Message type support
      with {:ok, data} <- Protobuf.JSON.encode(v) do
        {:ok, Temporal.Converter.new_payload(:"json/protobuf", data)}
      end
    else
      {:error, :not_supported}
    end
  end

  @impl true
  def decode(v, opts \\ []) do
    # If message type metadata is present and it's in the map, decode from
    # that
    opts = Enum.into(opts, %{})

    with %{"messageType" => message_type} <- v.metadata,
         %{:proto_messages => message_map} <- opts,
         %{^message_type => message_mod} <- message_map do
      Protobuf.JSON.decode(v.data, message_mod)
    else
      _ ->
        {:ok,
         %Temporal.Converter.ProtoJSONRef{
           json: v.data,
           message_type: Map.get(v.metadata, "messageType")
         }}
    end
  end
end

defmodule Temporal.Converter.ProtoBinaryRef do
  @enforce_keys [:data]
  defstruct [:data, message_type: nil]
end

defmodule Temporal.Converter.ProtoBinary do
  @behaviour Temporal.Converter

  @impl true
  def encode(v, _ \\ []) do
    if Temporal.Utility.is_proto(v) do
      # TODO(cretz): Message type support
      with {:ok, data} <- Protobuf.encode(v) do
        {:ok, Temporal.Converter.new_payload(:"binary/protobuf", data)}
      end
    else
      {:error, :not_supported}
    end
  end

  @impl true
  def decode(v, opts \\ []) do
    # If message type metadata is present and it's in the map, decode from
    # that
    opts = Enum.into(opts, %{})

    with %{"messageType" => message_type} <- v.metadata,
         %{:proto_messages => message_map} <- opts,
         %{^message_type => message_mod} <- message_map do
      Protobuf.decode(v.data, message_mod)
    else
      _ ->
        {:ok,
         %Temporal.Converter.ProtoBinaryRef{
           data: v.data,
           message_type: Map.get(v.metadata, "messageType")
         }}
    end
  end
end

defmodule Temporal.Converter.JSON do
  @behaviour Temporal.Converter

  @impl true
  def encode(v, _ \\ []) do
    with {:ok, str} <- Jason.encode(v) do
      {:ok, Temporal.Converter.new_payload(:"json/plain", str)}
    end
  end

  @impl true
  def decode(v, _ \\ []) do
    Jason.decode(v.data)
  end
end

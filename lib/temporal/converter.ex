defmodule Temporal.Converter do
  @type t :: module

  @callback encode(any, %{}) ::
              {:ok, Temporal.Api.Common.V1.Payload.t()}
              | {:error, :not_supported}
              | {:error, String.t()}

  @callback decode(Temporal.Api.Common.V1.Payload.t(), %{}) :: {:ok, any} | {:error, String.t()}

  def new_payload(encoding, data, metadata \\ %{}) do
    Temporal.Api.Common.V1.Payload.new!(
      metadata: %{metadata | "encoding" => to_string(encoding)},
      data: data
    )
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
    payload_encoding = v.metadata["encoding"]

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

  defmodule Default do
    @behaviour Temporal.Converter

    @converters [
      # Order is important
      "binary/null": Temporal.Converter.BinaryNull,
      "binary/plain": Temporal.Converter.BinaryPlain,
      "json/protobuf": Temporal.Converter.ProtoJSON
      # TODO(cretz): More
    ]

    def converters(), do: @converters

    @impl true
    def encode(v, opts), do: Temporal.Converter.encode_composite(v, @converters, opts)

    @impl true
    def decode(v, opts), do: Temporal.Converter.decode_composite(v, @converters, opts)
  end

  defmodule BinaryNull do
    @behaviour Temporal.Converter

    @impl true
    def encode(v, _) do
      if is_nil(v) do
        {:ok, Temporal.Converter.new_payload(:"binary/null", "")}
      else
        {:error, :not_supported}
      end
    end

    @impl true
    def decode(_, _), do: {:ok, nil}
  end

  defmodule BinaryPlain do
    @behaviour Temporal.Converter

    @impl true
    def encode(v, _) do
      if is_binary(v) do
        {:ok, Temporal.Converter.new_payload(:"binary/plain", v)}
      else
        {:error, :not_supported}
      end
    end

    @impl true
    def decode(v, _), do: {:ok, v.data}
  end

  defmodule ProtoJSONRef do
    @enforce_keys [:json]
    defstruct [:json, message_type: nil]
  end

  defmodule ProtoJSON do
    @behaviour Temporal.Converter

    @impl true
    def encode(v, _) do
      if Map.has_key?(v, :__message_props__) do
        # TODO(cretz): Message type support
        {:ok, Temporal.Converter.new_payload(:"json/protobuf", Protobuf.JSON.encode!(v))}
      else
        {:error, :not_supported}
      end
    end

    @impl true
    def decode(v, opts) do
      # If message type metadata is present and it's in the map, decode from
      # that
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
end

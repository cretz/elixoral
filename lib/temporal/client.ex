defmodule Temporal.Client do
  @enforce_keys [:channel]
  defstruct [:channel]

  def connect(addr, opts \\ %Temporal.Client.ConnectOptions{}) do
    with {:ok, channel} <- GRPC.Stub.connect(addr, opts.grpc_opts) do
      {:ok, %Temporal.Client{channel: channel}}
    end
  end

  def start_workflow(client, workflow, args \\ [], opts) do
    # TODO
  end
end

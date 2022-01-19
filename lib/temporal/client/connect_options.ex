defmodule Temporal.Client.ConnectOptions do
  @enforce_keys [:addr]
  defstruct [:addr, grpc_opts: []]
end

defmodule Temporal.Core.Native do
  use Rustler, otp_app: :elixoral, crate: "core_nif"

  def some_name(), do: :erlang.nif_error(:nif_not_loaded)
end

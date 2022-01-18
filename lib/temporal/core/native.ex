defmodule Temporal.Core.Native do
  @moduledoc false
  use Rustler, otp_app: :elixoral, crate: "core_nif"

  def some_name(), do: err()

  def runtime_new(), do: err()
  def core_runtime_start(_runtime, _req_id, _opts), do: err()
  def register_worker(_core_runtime, _req_id, _config), do: err()
  def poll_workflow_activation(_core_runtime, _req_id, _task_queue), do: err()
  def poll_activity_task(_core_runtime, _req_id, _task_queue), do: err()
  def complete_workflow_activation(_core_runtime, _req_id, _proto), do: err()
  def complete_activity_task(_core_runtime, _req_id, _proto), do: err()
  def record_activity_heartbeat(_core_runtime, _req_id, _proto), do: err()
  def request_workflow_eviction(_core_runtime, _req_id, _task_queue, _run_id), do: err()

  defp err(), do: :erlang.nif_error(:nif_not_loaded)
end

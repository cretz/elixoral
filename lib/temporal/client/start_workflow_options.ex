defmodule Temporal.Client.StartWorkflowOptions do
  @enforce_keys [:workflow, :workflow_id, :task_queue]
  defstruct [:workflow, :workflow_id, :task_queue, args: [], namespace: "default"]
end

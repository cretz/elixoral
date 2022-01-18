defmodule Temporal.Client.StartWorkflowOptions do
  @enforce_keys [:workflow_id, :task_queue]
  defstruct [:workflow_id, :task_queue, args: []]
end

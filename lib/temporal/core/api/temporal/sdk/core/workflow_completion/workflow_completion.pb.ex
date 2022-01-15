defmodule Temporal.Coresdk.WorkflowCompletion.WorkflowActivationCompletion do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          status:
            {:successful, Temporal.Coresdk.WorkflowCompletion.Success.t() | nil}
            | {:failed, Temporal.Coresdk.WorkflowCompletion.Failure.t() | nil},
          task_queue: String.t(),
          run_id: String.t()
        }

  defstruct status: nil,
            task_queue: "",
            run_id: ""

  oneof :status, 0

  field :task_queue, 1, type: :string, json_name: "taskQueue"
  field :run_id, 2, type: :string, json_name: "runId"
  field :successful, 3, type: Temporal.Coresdk.WorkflowCompletion.Success, oneof: 0
  field :failed, 4, type: Temporal.Coresdk.WorkflowCompletion.Failure, oneof: 0
end
defmodule Temporal.Coresdk.WorkflowCompletion.Success do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          commands: [Temporal.Coresdk.WorkflowCommands.WorkflowCommand.t()]
        }

  defstruct commands: []

  field :commands, 1, repeated: true, type: Temporal.Coresdk.WorkflowCommands.WorkflowCommand
end
defmodule Temporal.Coresdk.WorkflowCompletion.Failure do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          failure: Temporal.Temporal.Api.Failure.V1.Failure.t() | nil
        }

  defstruct failure: nil

  field :failure, 1, type: Temporal.Temporal.Api.Failure.V1.Failure
end

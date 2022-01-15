defmodule Temporal.Coresdk.ActivityHeartbeat do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          task_token: binary,
          task_queue: String.t(),
          details: [Temporal.Coresdk.Common.Payload.t()]
        }

  defstruct task_token: "",
            task_queue: "",
            details: []

  field :task_token, 1, type: :bytes, json_name: "taskToken"
  field :task_queue, 2, type: :string, json_name: "taskQueue"
  field :details, 3, repeated: true, type: Temporal.Coresdk.Common.Payload
end
defmodule Temporal.Coresdk.ActivityTaskCompletion do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          task_token: binary,
          task_queue: String.t(),
          result: Temporal.Coresdk.ActivityResult.ActivityExecutionResult.t() | nil
        }

  defstruct task_token: "",
            task_queue: "",
            result: nil

  field :task_token, 1, type: :bytes, json_name: "taskToken"
  field :task_queue, 2, type: :string, json_name: "taskQueue"
  field :result, 3, type: Temporal.Coresdk.ActivityResult.ActivityExecutionResult
end

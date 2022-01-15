defmodule Temporal.Coresdk.ActivityTask.ActivityCancelReason do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :NOT_FOUND | :CANCELLED | :TIMED_OUT

  field :NOT_FOUND, 0
  field :CANCELLED, 1
  field :TIMED_OUT, 2
end
defmodule Temporal.Coresdk.ActivityTask.ActivityTask do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          variant:
            {:start, Temporal.Coresdk.ActivityTask.Start.t() | nil}
            | {:cancel, Temporal.Coresdk.ActivityTask.Cancel.t() | nil},
          task_token: binary
        }

  defstruct variant: nil,
            task_token: ""

  oneof :variant, 0

  field :task_token, 1, type: :bytes, json_name: "taskToken"
  field :start, 3, type: Temporal.Coresdk.ActivityTask.Start, oneof: 0
  field :cancel, 4, type: Temporal.Coresdk.ActivityTask.Cancel, oneof: 0
end
defmodule Temporal.Coresdk.ActivityTask.Start.HeaderFieldsEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: Temporal.Coresdk.Common.Payload.t() | nil
        }

  defstruct key: "",
            value: nil

  field :key, 1, type: :string
  field :value, 2, type: Temporal.Coresdk.Common.Payload
end
defmodule Temporal.Coresdk.ActivityTask.Start do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          workflow_namespace: String.t(),
          workflow_type: String.t(),
          workflow_execution: Temporal.Coresdk.Common.WorkflowExecution.t() | nil,
          activity_id: String.t(),
          activity_type: String.t(),
          header_fields: %{String.t() => Temporal.Coresdk.Common.Payload.t() | nil},
          input: [Temporal.Coresdk.Common.Payload.t()],
          heartbeat_details: [Temporal.Coresdk.Common.Payload.t()],
          scheduled_time: Temporal.Google.Protobuf.Timestamp.t() | nil,
          current_attempt_scheduled_time: Temporal.Google.Protobuf.Timestamp.t() | nil,
          started_time: Temporal.Google.Protobuf.Timestamp.t() | nil,
          attempt: non_neg_integer,
          schedule_to_close_timeout: Temporal.Google.Protobuf.Duration.t() | nil,
          start_to_close_timeout: Temporal.Google.Protobuf.Duration.t() | nil,
          heartbeat_timeout: Temporal.Google.Protobuf.Duration.t() | nil,
          retry_policy: Temporal.Coresdk.Common.RetryPolicy.t() | nil,
          is_local: boolean
        }

  defstruct workflow_namespace: "",
            workflow_type: "",
            workflow_execution: nil,
            activity_id: "",
            activity_type: "",
            header_fields: %{},
            input: [],
            heartbeat_details: [],
            scheduled_time: nil,
            current_attempt_scheduled_time: nil,
            started_time: nil,
            attempt: 0,
            schedule_to_close_timeout: nil,
            start_to_close_timeout: nil,
            heartbeat_timeout: nil,
            retry_policy: nil,
            is_local: false

  field :workflow_namespace, 1, type: :string, json_name: "workflowNamespace"
  field :workflow_type, 2, type: :string, json_name: "workflowType"

  field :workflow_execution, 3,
    type: Temporal.Coresdk.Common.WorkflowExecution,
    json_name: "workflowExecution"

  field :activity_id, 4, type: :string, json_name: "activityId"
  field :activity_type, 5, type: :string, json_name: "activityType"

  field :header_fields, 6,
    repeated: true,
    type: Temporal.Coresdk.ActivityTask.Start.HeaderFieldsEntry,
    json_name: "headerFields",
    map: true

  field :input, 7, repeated: true, type: Temporal.Coresdk.Common.Payload

  field :heartbeat_details, 8,
    repeated: true,
    type: Temporal.Coresdk.Common.Payload,
    json_name: "heartbeatDetails"

  field :scheduled_time, 9, type: Temporal.Google.Protobuf.Timestamp, json_name: "scheduledTime"

  field :current_attempt_scheduled_time, 10,
    type: Temporal.Google.Protobuf.Timestamp,
    json_name: "currentAttemptScheduledTime"

  field :started_time, 11, type: Temporal.Google.Protobuf.Timestamp, json_name: "startedTime"
  field :attempt, 12, type: :uint32

  field :schedule_to_close_timeout, 13,
    type: Temporal.Google.Protobuf.Duration,
    json_name: "scheduleToCloseTimeout"

  field :start_to_close_timeout, 14,
    type: Temporal.Google.Protobuf.Duration,
    json_name: "startToCloseTimeout"

  field :heartbeat_timeout, 15,
    type: Temporal.Google.Protobuf.Duration,
    json_name: "heartbeatTimeout"

  field :retry_policy, 16, type: Temporal.Coresdk.Common.RetryPolicy, json_name: "retryPolicy"
  field :is_local, 17, type: :bool, json_name: "isLocal"
end
defmodule Temporal.Coresdk.ActivityTask.Cancel do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          reason: Temporal.Coresdk.ActivityTask.ActivityCancelReason.t()
        }

  defstruct reason: :NOT_FOUND

  field :reason, 1, type: Temporal.Coresdk.ActivityTask.ActivityCancelReason, enum: true
end

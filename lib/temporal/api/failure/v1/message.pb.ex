defmodule Temporal.Api.Failure.V1.ApplicationFailureInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          type: String.t(),
          non_retryable: boolean,
          details: Temporal.Api.Common.V1.Payloads.t() | nil
        }

  defstruct type: "",
            non_retryable: false,
            details: nil

  field :type, 1, type: :string
  field :non_retryable, 2, type: :bool, json_name: "nonRetryable"
  field :details, 3, type: Temporal.Api.Common.V1.Payloads
end
defmodule Temporal.Api.Failure.V1.TimeoutFailureInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          timeout_type: Temporal.Api.Enums.V1.TimeoutType.t(),
          last_heartbeat_details: Temporal.Api.Common.V1.Payloads.t() | nil
        }

  defstruct timeout_type: :TIMEOUT_TYPE_UNSPECIFIED,
            last_heartbeat_details: nil

  field :timeout_type, 1,
    type: Temporal.Api.Enums.V1.TimeoutType,
    json_name: "timeoutType",
    enum: true

  field :last_heartbeat_details, 2,
    type: Temporal.Api.Common.V1.Payloads,
    json_name: "lastHeartbeatDetails"
end
defmodule Temporal.Api.Failure.V1.CanceledFailureInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          details: Temporal.Api.Common.V1.Payloads.t() | nil
        }

  defstruct details: nil

  field :details, 1, type: Temporal.Api.Common.V1.Payloads
end
defmodule Temporal.Api.Failure.V1.TerminatedFailureInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}

  defstruct []
end
defmodule Temporal.Api.Failure.V1.ServerFailureInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          non_retryable: boolean
        }

  defstruct non_retryable: false

  field :non_retryable, 1, type: :bool, json_name: "nonRetryable"
end
defmodule Temporal.Api.Failure.V1.ResetWorkflowFailureInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          last_heartbeat_details: Temporal.Api.Common.V1.Payloads.t() | nil
        }

  defstruct last_heartbeat_details: nil

  field :last_heartbeat_details, 1,
    type: Temporal.Api.Common.V1.Payloads,
    json_name: "lastHeartbeatDetails"
end
defmodule Temporal.Api.Failure.V1.ActivityFailureInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          scheduled_event_id: integer,
          started_event_id: integer,
          identity: String.t(),
          activity_type: Temporal.Api.Common.V1.ActivityType.t() | nil,
          activity_id: String.t(),
          retry_state: Temporal.Api.Enums.V1.RetryState.t()
        }

  defstruct scheduled_event_id: 0,
            started_event_id: 0,
            identity: "",
            activity_type: nil,
            activity_id: "",
            retry_state: :RETRY_STATE_UNSPECIFIED

  field :scheduled_event_id, 1, type: :int64, json_name: "scheduledEventId"
  field :started_event_id, 2, type: :int64, json_name: "startedEventId"
  field :identity, 3, type: :string
  field :activity_type, 4, type: Temporal.Api.Common.V1.ActivityType, json_name: "activityType"
  field :activity_id, 5, type: :string, json_name: "activityId"

  field :retry_state, 6,
    type: Temporal.Api.Enums.V1.RetryState,
    json_name: "retryState",
    enum: true
end
defmodule Temporal.Api.Failure.V1.ChildWorkflowExecutionFailureInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          namespace: String.t(),
          workflow_execution: Temporal.Api.Common.V1.WorkflowExecution.t() | nil,
          workflow_type: Temporal.Api.Common.V1.WorkflowType.t() | nil,
          initiated_event_id: integer,
          started_event_id: integer,
          retry_state: Temporal.Api.Enums.V1.RetryState.t()
        }

  defstruct namespace: "",
            workflow_execution: nil,
            workflow_type: nil,
            initiated_event_id: 0,
            started_event_id: 0,
            retry_state: :RETRY_STATE_UNSPECIFIED

  field :namespace, 1, type: :string

  field :workflow_execution, 2,
    type: Temporal.Api.Common.V1.WorkflowExecution,
    json_name: "workflowExecution"

  field :workflow_type, 3, type: Temporal.Api.Common.V1.WorkflowType, json_name: "workflowType"
  field :initiated_event_id, 4, type: :int64, json_name: "initiatedEventId"
  field :started_event_id, 5, type: :int64, json_name: "startedEventId"

  field :retry_state, 6,
    type: Temporal.Api.Enums.V1.RetryState,
    json_name: "retryState",
    enum: true
end
defmodule Temporal.Api.Failure.V1.Failure do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          failure_info:
            {:application_failure_info, Temporal.Api.Failure.V1.ApplicationFailureInfo.t() | nil}
            | {:timeout_failure_info, Temporal.Api.Failure.V1.TimeoutFailureInfo.t() | nil}
            | {:canceled_failure_info, Temporal.Api.Failure.V1.CanceledFailureInfo.t() | nil}
            | {:terminated_failure_info, Temporal.Api.Failure.V1.TerminatedFailureInfo.t() | nil}
            | {:server_failure_info, Temporal.Api.Failure.V1.ServerFailureInfo.t() | nil}
            | {:reset_workflow_failure_info,
               Temporal.Api.Failure.V1.ResetWorkflowFailureInfo.t() | nil}
            | {:activity_failure_info, Temporal.Api.Failure.V1.ActivityFailureInfo.t() | nil}
            | {:child_workflow_execution_failure_info,
               Temporal.Api.Failure.V1.ChildWorkflowExecutionFailureInfo.t() | nil},
          message: String.t(),
          source: String.t(),
          stack_trace: String.t(),
          cause: Temporal.Api.Failure.V1.Failure.t() | nil
        }

  defstruct failure_info: nil,
            message: "",
            source: "",
            stack_trace: "",
            cause: nil

  oneof :failure_info, 0

  field :message, 1, type: :string
  field :source, 2, type: :string
  field :stack_trace, 3, type: :string, json_name: "stackTrace"
  field :cause, 4, type: Temporal.Api.Failure.V1.Failure

  field :application_failure_info, 5,
    type: Temporal.Api.Failure.V1.ApplicationFailureInfo,
    json_name: "applicationFailureInfo",
    oneof: 0

  field :timeout_failure_info, 6,
    type: Temporal.Api.Failure.V1.TimeoutFailureInfo,
    json_name: "timeoutFailureInfo",
    oneof: 0

  field :canceled_failure_info, 7,
    type: Temporal.Api.Failure.V1.CanceledFailureInfo,
    json_name: "canceledFailureInfo",
    oneof: 0

  field :terminated_failure_info, 8,
    type: Temporal.Api.Failure.V1.TerminatedFailureInfo,
    json_name: "terminatedFailureInfo",
    oneof: 0

  field :server_failure_info, 9,
    type: Temporal.Api.Failure.V1.ServerFailureInfo,
    json_name: "serverFailureInfo",
    oneof: 0

  field :reset_workflow_failure_info, 10,
    type: Temporal.Api.Failure.V1.ResetWorkflowFailureInfo,
    json_name: "resetWorkflowFailureInfo",
    oneof: 0

  field :activity_failure_info, 11,
    type: Temporal.Api.Failure.V1.ActivityFailureInfo,
    json_name: "activityFailureInfo",
    oneof: 0

  field :child_workflow_execution_failure_info, 12,
    type: Temporal.Api.Failure.V1.ChildWorkflowExecutionFailureInfo,
    json_name: "childWorkflowExecutionFailureInfo",
    oneof: 0
end

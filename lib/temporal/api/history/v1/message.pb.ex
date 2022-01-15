defmodule Temporal.Api.History.V1.WorkflowExecutionStartedEventAttributes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          workflow_type: Temporal.Api.Common.V1.WorkflowType.t() | nil,
          parent_workflow_namespace: String.t(),
          parent_workflow_execution: Temporal.Api.Common.V1.WorkflowExecution.t() | nil,
          parent_initiated_event_id: integer,
          task_queue: Temporal.Api.Taskqueue.V1.TaskQueue.t() | nil,
          input: Temporal.Api.Common.V1.Payloads.t() | nil,
          workflow_execution_timeout: Google.Protobuf.Duration.t() | nil,
          workflow_run_timeout: Google.Protobuf.Duration.t() | nil,
          workflow_task_timeout: Google.Protobuf.Duration.t() | nil,
          continued_execution_run_id: String.t(),
          initiator: Temporal.Api.Enums.V1.ContinueAsNewInitiator.t(),
          continued_failure: Temporal.Api.Failure.V1.Failure.t() | nil,
          last_completion_result: Temporal.Api.Common.V1.Payloads.t() | nil,
          original_execution_run_id: String.t(),
          identity: String.t(),
          first_execution_run_id: String.t(),
          retry_policy: Temporal.Api.Common.V1.RetryPolicy.t() | nil,
          attempt: integer,
          workflow_execution_expiration_time: Google.Protobuf.Timestamp.t() | nil,
          cron_schedule: String.t(),
          first_workflow_task_backoff: Google.Protobuf.Duration.t() | nil,
          memo: Temporal.Api.Common.V1.Memo.t() | nil,
          search_attributes: Temporal.Api.Common.V1.SearchAttributes.t() | nil,
          prev_auto_reset_points: Temporal.Api.Workflow.V1.ResetPoints.t() | nil,
          header: Temporal.Api.Common.V1.Header.t() | nil
        }

  defstruct workflow_type: nil,
            parent_workflow_namespace: "",
            parent_workflow_execution: nil,
            parent_initiated_event_id: 0,
            task_queue: nil,
            input: nil,
            workflow_execution_timeout: nil,
            workflow_run_timeout: nil,
            workflow_task_timeout: nil,
            continued_execution_run_id: "",
            initiator: :CONTINUE_AS_NEW_INITIATOR_UNSPECIFIED,
            continued_failure: nil,
            last_completion_result: nil,
            original_execution_run_id: "",
            identity: "",
            first_execution_run_id: "",
            retry_policy: nil,
            attempt: 0,
            workflow_execution_expiration_time: nil,
            cron_schedule: "",
            first_workflow_task_backoff: nil,
            memo: nil,
            search_attributes: nil,
            prev_auto_reset_points: nil,
            header: nil

  field :workflow_type, 1, type: Temporal.Api.Common.V1.WorkflowType, json_name: "workflowType"
  field :parent_workflow_namespace, 2, type: :string, json_name: "parentWorkflowNamespace"

  field :parent_workflow_execution, 3,
    type: Temporal.Api.Common.V1.WorkflowExecution,
    json_name: "parentWorkflowExecution"

  field :parent_initiated_event_id, 4, type: :int64, json_name: "parentInitiatedEventId"
  field :task_queue, 5, type: Temporal.Api.Taskqueue.V1.TaskQueue, json_name: "taskQueue"
  field :input, 6, type: Temporal.Api.Common.V1.Payloads

  field :workflow_execution_timeout, 7,
    type: Google.Protobuf.Duration,
    json_name: "workflowExecutionTimeout",
    deprecated: false

  field :workflow_run_timeout, 8,
    type: Google.Protobuf.Duration,
    json_name: "workflowRunTimeout",
    deprecated: false

  field :workflow_task_timeout, 9,
    type: Google.Protobuf.Duration,
    json_name: "workflowTaskTimeout",
    deprecated: false

  field :continued_execution_run_id, 10, type: :string, json_name: "continuedExecutionRunId"
  field :initiator, 11, type: Temporal.Api.Enums.V1.ContinueAsNewInitiator, enum: true

  field :continued_failure, 12,
    type: Temporal.Api.Failure.V1.Failure,
    json_name: "continuedFailure"

  field :last_completion_result, 13,
    type: Temporal.Api.Common.V1.Payloads,
    json_name: "lastCompletionResult"

  field :original_execution_run_id, 14, type: :string, json_name: "originalExecutionRunId"
  field :identity, 15, type: :string
  field :first_execution_run_id, 16, type: :string, json_name: "firstExecutionRunId"
  field :retry_policy, 17, type: Temporal.Api.Common.V1.RetryPolicy, json_name: "retryPolicy"
  field :attempt, 18, type: :int32

  field :workflow_execution_expiration_time, 19,
    type: Google.Protobuf.Timestamp,
    json_name: "workflowExecutionExpirationTime",
    deprecated: false

  field :cron_schedule, 20, type: :string, json_name: "cronSchedule"

  field :first_workflow_task_backoff, 21,
    type: Google.Protobuf.Duration,
    json_name: "firstWorkflowTaskBackoff",
    deprecated: false

  field :memo, 22, type: Temporal.Api.Common.V1.Memo

  field :search_attributes, 23,
    type: Temporal.Api.Common.V1.SearchAttributes,
    json_name: "searchAttributes"

  field :prev_auto_reset_points, 24,
    type: Temporal.Api.Workflow.V1.ResetPoints,
    json_name: "prevAutoResetPoints"

  field :header, 25, type: Temporal.Api.Common.V1.Header
end
defmodule Temporal.Api.History.V1.WorkflowExecutionCompletedEventAttributes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          result: Temporal.Api.Common.V1.Payloads.t() | nil,
          workflow_task_completed_event_id: integer,
          new_execution_run_id: String.t()
        }

  defstruct result: nil,
            workflow_task_completed_event_id: 0,
            new_execution_run_id: ""

  field :result, 1, type: Temporal.Api.Common.V1.Payloads

  field :workflow_task_completed_event_id, 2,
    type: :int64,
    json_name: "workflowTaskCompletedEventId"

  field :new_execution_run_id, 3, type: :string, json_name: "newExecutionRunId"
end
defmodule Temporal.Api.History.V1.WorkflowExecutionFailedEventAttributes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          failure: Temporal.Api.Failure.V1.Failure.t() | nil,
          retry_state: Temporal.Api.Enums.V1.RetryState.t(),
          workflow_task_completed_event_id: integer,
          new_execution_run_id: String.t()
        }

  defstruct failure: nil,
            retry_state: :RETRY_STATE_UNSPECIFIED,
            workflow_task_completed_event_id: 0,
            new_execution_run_id: ""

  field :failure, 1, type: Temporal.Api.Failure.V1.Failure

  field :retry_state, 2,
    type: Temporal.Api.Enums.V1.RetryState,
    json_name: "retryState",
    enum: true

  field :workflow_task_completed_event_id, 3,
    type: :int64,
    json_name: "workflowTaskCompletedEventId"

  field :new_execution_run_id, 4, type: :string, json_name: "newExecutionRunId"
end
defmodule Temporal.Api.History.V1.WorkflowExecutionTimedOutEventAttributes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          retry_state: Temporal.Api.Enums.V1.RetryState.t(),
          new_execution_run_id: String.t()
        }

  defstruct retry_state: :RETRY_STATE_UNSPECIFIED,
            new_execution_run_id: ""

  field :retry_state, 1,
    type: Temporal.Api.Enums.V1.RetryState,
    json_name: "retryState",
    enum: true

  field :new_execution_run_id, 2, type: :string, json_name: "newExecutionRunId"
end
defmodule Temporal.Api.History.V1.WorkflowExecutionContinuedAsNewEventAttributes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          new_execution_run_id: String.t(),
          workflow_type: Temporal.Api.Common.V1.WorkflowType.t() | nil,
          task_queue: Temporal.Api.Taskqueue.V1.TaskQueue.t() | nil,
          input: Temporal.Api.Common.V1.Payloads.t() | nil,
          workflow_run_timeout: Google.Protobuf.Duration.t() | nil,
          workflow_task_timeout: Google.Protobuf.Duration.t() | nil,
          workflow_task_completed_event_id: integer,
          backoff_start_interval: Google.Protobuf.Duration.t() | nil,
          initiator: Temporal.Api.Enums.V1.ContinueAsNewInitiator.t(),
          failure: Temporal.Api.Failure.V1.Failure.t() | nil,
          last_completion_result: Temporal.Api.Common.V1.Payloads.t() | nil,
          header: Temporal.Api.Common.V1.Header.t() | nil,
          memo: Temporal.Api.Common.V1.Memo.t() | nil,
          search_attributes: Temporal.Api.Common.V1.SearchAttributes.t() | nil
        }

  defstruct new_execution_run_id: "",
            workflow_type: nil,
            task_queue: nil,
            input: nil,
            workflow_run_timeout: nil,
            workflow_task_timeout: nil,
            workflow_task_completed_event_id: 0,
            backoff_start_interval: nil,
            initiator: :CONTINUE_AS_NEW_INITIATOR_UNSPECIFIED,
            failure: nil,
            last_completion_result: nil,
            header: nil,
            memo: nil,
            search_attributes: nil

  field :new_execution_run_id, 1, type: :string, json_name: "newExecutionRunId"
  field :workflow_type, 2, type: Temporal.Api.Common.V1.WorkflowType, json_name: "workflowType"
  field :task_queue, 3, type: Temporal.Api.Taskqueue.V1.TaskQueue, json_name: "taskQueue"
  field :input, 4, type: Temporal.Api.Common.V1.Payloads

  field :workflow_run_timeout, 5,
    type: Google.Protobuf.Duration,
    json_name: "workflowRunTimeout",
    deprecated: false

  field :workflow_task_timeout, 6,
    type: Google.Protobuf.Duration,
    json_name: "workflowTaskTimeout",
    deprecated: false

  field :workflow_task_completed_event_id, 7,
    type: :int64,
    json_name: "workflowTaskCompletedEventId"

  field :backoff_start_interval, 8,
    type: Google.Protobuf.Duration,
    json_name: "backoffStartInterval",
    deprecated: false

  field :initiator, 9, type: Temporal.Api.Enums.V1.ContinueAsNewInitiator, enum: true
  field :failure, 10, type: Temporal.Api.Failure.V1.Failure

  field :last_completion_result, 11,
    type: Temporal.Api.Common.V1.Payloads,
    json_name: "lastCompletionResult"

  field :header, 12, type: Temporal.Api.Common.V1.Header
  field :memo, 13, type: Temporal.Api.Common.V1.Memo

  field :search_attributes, 14,
    type: Temporal.Api.Common.V1.SearchAttributes,
    json_name: "searchAttributes"
end
defmodule Temporal.Api.History.V1.WorkflowTaskScheduledEventAttributes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          task_queue: Temporal.Api.Taskqueue.V1.TaskQueue.t() | nil,
          start_to_close_timeout: Google.Protobuf.Duration.t() | nil,
          attempt: integer
        }

  defstruct task_queue: nil,
            start_to_close_timeout: nil,
            attempt: 0

  field :task_queue, 1, type: Temporal.Api.Taskqueue.V1.TaskQueue, json_name: "taskQueue"

  field :start_to_close_timeout, 2,
    type: Google.Protobuf.Duration,
    json_name: "startToCloseTimeout",
    deprecated: false

  field :attempt, 3, type: :int32
end
defmodule Temporal.Api.History.V1.WorkflowTaskStartedEventAttributes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          scheduled_event_id: integer,
          identity: String.t(),
          request_id: String.t()
        }

  defstruct scheduled_event_id: 0,
            identity: "",
            request_id: ""

  field :scheduled_event_id, 1, type: :int64, json_name: "scheduledEventId"
  field :identity, 2, type: :string
  field :request_id, 3, type: :string, json_name: "requestId"
end
defmodule Temporal.Api.History.V1.WorkflowTaskCompletedEventAttributes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          scheduled_event_id: integer,
          started_event_id: integer,
          identity: String.t(),
          binary_checksum: String.t()
        }

  defstruct scheduled_event_id: 0,
            started_event_id: 0,
            identity: "",
            binary_checksum: ""

  field :scheduled_event_id, 1, type: :int64, json_name: "scheduledEventId"
  field :started_event_id, 2, type: :int64, json_name: "startedEventId"
  field :identity, 3, type: :string
  field :binary_checksum, 4, type: :string, json_name: "binaryChecksum"
end
defmodule Temporal.Api.History.V1.WorkflowTaskTimedOutEventAttributes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          scheduled_event_id: integer,
          started_event_id: integer,
          timeout_type: Temporal.Api.Enums.V1.TimeoutType.t()
        }

  defstruct scheduled_event_id: 0,
            started_event_id: 0,
            timeout_type: :TIMEOUT_TYPE_UNSPECIFIED

  field :scheduled_event_id, 1, type: :int64, json_name: "scheduledEventId"
  field :started_event_id, 2, type: :int64, json_name: "startedEventId"

  field :timeout_type, 3,
    type: Temporal.Api.Enums.V1.TimeoutType,
    json_name: "timeoutType",
    enum: true
end
defmodule Temporal.Api.History.V1.WorkflowTaskFailedEventAttributes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          scheduled_event_id: integer,
          started_event_id: integer,
          cause: Temporal.Api.Enums.V1.WorkflowTaskFailedCause.t(),
          failure: Temporal.Api.Failure.V1.Failure.t() | nil,
          identity: String.t(),
          base_run_id: String.t(),
          new_run_id: String.t(),
          fork_event_version: integer,
          binary_checksum: String.t()
        }

  defstruct scheduled_event_id: 0,
            started_event_id: 0,
            cause: :WORKFLOW_TASK_FAILED_CAUSE_UNSPECIFIED,
            failure: nil,
            identity: "",
            base_run_id: "",
            new_run_id: "",
            fork_event_version: 0,
            binary_checksum: ""

  field :scheduled_event_id, 1, type: :int64, json_name: "scheduledEventId"
  field :started_event_id, 2, type: :int64, json_name: "startedEventId"
  field :cause, 3, type: Temporal.Api.Enums.V1.WorkflowTaskFailedCause, enum: true
  field :failure, 4, type: Temporal.Api.Failure.V1.Failure
  field :identity, 5, type: :string
  field :base_run_id, 6, type: :string, json_name: "baseRunId"
  field :new_run_id, 7, type: :string, json_name: "newRunId"
  field :fork_event_version, 8, type: :int64, json_name: "forkEventVersion"
  field :binary_checksum, 9, type: :string, json_name: "binaryChecksum"
end
defmodule Temporal.Api.History.V1.ActivityTaskScheduledEventAttributes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          activity_id: String.t(),
          activity_type: Temporal.Api.Common.V1.ActivityType.t() | nil,
          namespace: String.t(),
          task_queue: Temporal.Api.Taskqueue.V1.TaskQueue.t() | nil,
          header: Temporal.Api.Common.V1.Header.t() | nil,
          input: Temporal.Api.Common.V1.Payloads.t() | nil,
          schedule_to_close_timeout: Google.Protobuf.Duration.t() | nil,
          schedule_to_start_timeout: Google.Protobuf.Duration.t() | nil,
          start_to_close_timeout: Google.Protobuf.Duration.t() | nil,
          heartbeat_timeout: Google.Protobuf.Duration.t() | nil,
          workflow_task_completed_event_id: integer,
          retry_policy: Temporal.Api.Common.V1.RetryPolicy.t() | nil
        }

  defstruct activity_id: "",
            activity_type: nil,
            namespace: "",
            task_queue: nil,
            header: nil,
            input: nil,
            schedule_to_close_timeout: nil,
            schedule_to_start_timeout: nil,
            start_to_close_timeout: nil,
            heartbeat_timeout: nil,
            workflow_task_completed_event_id: 0,
            retry_policy: nil

  field :activity_id, 1, type: :string, json_name: "activityId"
  field :activity_type, 2, type: Temporal.Api.Common.V1.ActivityType, json_name: "activityType"
  field :namespace, 3, type: :string
  field :task_queue, 4, type: Temporal.Api.Taskqueue.V1.TaskQueue, json_name: "taskQueue"
  field :header, 5, type: Temporal.Api.Common.V1.Header
  field :input, 6, type: Temporal.Api.Common.V1.Payloads

  field :schedule_to_close_timeout, 7,
    type: Google.Protobuf.Duration,
    json_name: "scheduleToCloseTimeout",
    deprecated: false

  field :schedule_to_start_timeout, 8,
    type: Google.Protobuf.Duration,
    json_name: "scheduleToStartTimeout",
    deprecated: false

  field :start_to_close_timeout, 9,
    type: Google.Protobuf.Duration,
    json_name: "startToCloseTimeout",
    deprecated: false

  field :heartbeat_timeout, 10,
    type: Google.Protobuf.Duration,
    json_name: "heartbeatTimeout",
    deprecated: false

  field :workflow_task_completed_event_id, 11,
    type: :int64,
    json_name: "workflowTaskCompletedEventId"

  field :retry_policy, 12, type: Temporal.Api.Common.V1.RetryPolicy, json_name: "retryPolicy"
end
defmodule Temporal.Api.History.V1.ActivityTaskStartedEventAttributes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          scheduled_event_id: integer,
          identity: String.t(),
          request_id: String.t(),
          attempt: integer,
          last_failure: Temporal.Api.Failure.V1.Failure.t() | nil
        }

  defstruct scheduled_event_id: 0,
            identity: "",
            request_id: "",
            attempt: 0,
            last_failure: nil

  field :scheduled_event_id, 1, type: :int64, json_name: "scheduledEventId"
  field :identity, 2, type: :string
  field :request_id, 3, type: :string, json_name: "requestId"
  field :attempt, 4, type: :int32
  field :last_failure, 5, type: Temporal.Api.Failure.V1.Failure, json_name: "lastFailure"
end
defmodule Temporal.Api.History.V1.ActivityTaskCompletedEventAttributes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          result: Temporal.Api.Common.V1.Payloads.t() | nil,
          scheduled_event_id: integer,
          started_event_id: integer,
          identity: String.t()
        }

  defstruct result: nil,
            scheduled_event_id: 0,
            started_event_id: 0,
            identity: ""

  field :result, 1, type: Temporal.Api.Common.V1.Payloads
  field :scheduled_event_id, 2, type: :int64, json_name: "scheduledEventId"
  field :started_event_id, 3, type: :int64, json_name: "startedEventId"
  field :identity, 4, type: :string
end
defmodule Temporal.Api.History.V1.ActivityTaskFailedEventAttributes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          failure: Temporal.Api.Failure.V1.Failure.t() | nil,
          scheduled_event_id: integer,
          started_event_id: integer,
          identity: String.t(),
          retry_state: Temporal.Api.Enums.V1.RetryState.t()
        }

  defstruct failure: nil,
            scheduled_event_id: 0,
            started_event_id: 0,
            identity: "",
            retry_state: :RETRY_STATE_UNSPECIFIED

  field :failure, 1, type: Temporal.Api.Failure.V1.Failure
  field :scheduled_event_id, 2, type: :int64, json_name: "scheduledEventId"
  field :started_event_id, 3, type: :int64, json_name: "startedEventId"
  field :identity, 4, type: :string

  field :retry_state, 5,
    type: Temporal.Api.Enums.V1.RetryState,
    json_name: "retryState",
    enum: true
end
defmodule Temporal.Api.History.V1.ActivityTaskTimedOutEventAttributes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          failure: Temporal.Api.Failure.V1.Failure.t() | nil,
          scheduled_event_id: integer,
          started_event_id: integer,
          retry_state: Temporal.Api.Enums.V1.RetryState.t()
        }

  defstruct failure: nil,
            scheduled_event_id: 0,
            started_event_id: 0,
            retry_state: :RETRY_STATE_UNSPECIFIED

  field :failure, 1, type: Temporal.Api.Failure.V1.Failure
  field :scheduled_event_id, 2, type: :int64, json_name: "scheduledEventId"
  field :started_event_id, 3, type: :int64, json_name: "startedEventId"

  field :retry_state, 4,
    type: Temporal.Api.Enums.V1.RetryState,
    json_name: "retryState",
    enum: true
end
defmodule Temporal.Api.History.V1.ActivityTaskCancelRequestedEventAttributes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          scheduled_event_id: integer,
          workflow_task_completed_event_id: integer
        }

  defstruct scheduled_event_id: 0,
            workflow_task_completed_event_id: 0

  field :scheduled_event_id, 1, type: :int64, json_name: "scheduledEventId"

  field :workflow_task_completed_event_id, 2,
    type: :int64,
    json_name: "workflowTaskCompletedEventId"
end
defmodule Temporal.Api.History.V1.ActivityTaskCanceledEventAttributes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          details: Temporal.Api.Common.V1.Payloads.t() | nil,
          latest_cancel_requested_event_id: integer,
          scheduled_event_id: integer,
          started_event_id: integer,
          identity: String.t()
        }

  defstruct details: nil,
            latest_cancel_requested_event_id: 0,
            scheduled_event_id: 0,
            started_event_id: 0,
            identity: ""

  field :details, 1, type: Temporal.Api.Common.V1.Payloads

  field :latest_cancel_requested_event_id, 2,
    type: :int64,
    json_name: "latestCancelRequestedEventId"

  field :scheduled_event_id, 3, type: :int64, json_name: "scheduledEventId"
  field :started_event_id, 4, type: :int64, json_name: "startedEventId"
  field :identity, 5, type: :string
end
defmodule Temporal.Api.History.V1.TimerStartedEventAttributes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          timer_id: String.t(),
          start_to_fire_timeout: Google.Protobuf.Duration.t() | nil,
          workflow_task_completed_event_id: integer
        }

  defstruct timer_id: "",
            start_to_fire_timeout: nil,
            workflow_task_completed_event_id: 0

  field :timer_id, 1, type: :string, json_name: "timerId"

  field :start_to_fire_timeout, 2,
    type: Google.Protobuf.Duration,
    json_name: "startToFireTimeout",
    deprecated: false

  field :workflow_task_completed_event_id, 3,
    type: :int64,
    json_name: "workflowTaskCompletedEventId"
end
defmodule Temporal.Api.History.V1.TimerFiredEventAttributes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          timer_id: String.t(),
          started_event_id: integer
        }

  defstruct timer_id: "",
            started_event_id: 0

  field :timer_id, 1, type: :string, json_name: "timerId"
  field :started_event_id, 2, type: :int64, json_name: "startedEventId"
end
defmodule Temporal.Api.History.V1.TimerCanceledEventAttributes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          timer_id: String.t(),
          started_event_id: integer,
          workflow_task_completed_event_id: integer,
          identity: String.t()
        }

  defstruct timer_id: "",
            started_event_id: 0,
            workflow_task_completed_event_id: 0,
            identity: ""

  field :timer_id, 1, type: :string, json_name: "timerId"
  field :started_event_id, 2, type: :int64, json_name: "startedEventId"

  field :workflow_task_completed_event_id, 3,
    type: :int64,
    json_name: "workflowTaskCompletedEventId"

  field :identity, 4, type: :string
end
defmodule Temporal.Api.History.V1.WorkflowExecutionCancelRequestedEventAttributes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          cause: String.t(),
          external_initiated_event_id: integer,
          external_workflow_execution: Temporal.Api.Common.V1.WorkflowExecution.t() | nil,
          identity: String.t()
        }

  defstruct cause: "",
            external_initiated_event_id: 0,
            external_workflow_execution: nil,
            identity: ""

  field :cause, 1, type: :string
  field :external_initiated_event_id, 2, type: :int64, json_name: "externalInitiatedEventId"

  field :external_workflow_execution, 3,
    type: Temporal.Api.Common.V1.WorkflowExecution,
    json_name: "externalWorkflowExecution"

  field :identity, 4, type: :string
end
defmodule Temporal.Api.History.V1.WorkflowExecutionCanceledEventAttributes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          workflow_task_completed_event_id: integer,
          details: Temporal.Api.Common.V1.Payloads.t() | nil
        }

  defstruct workflow_task_completed_event_id: 0,
            details: nil

  field :workflow_task_completed_event_id, 1,
    type: :int64,
    json_name: "workflowTaskCompletedEventId"

  field :details, 2, type: Temporal.Api.Common.V1.Payloads
end
defmodule Temporal.Api.History.V1.MarkerRecordedEventAttributes.DetailsEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: Temporal.Api.Common.V1.Payloads.t() | nil
        }

  defstruct key: "",
            value: nil

  field :key, 1, type: :string
  field :value, 2, type: Temporal.Api.Common.V1.Payloads
end
defmodule Temporal.Api.History.V1.MarkerRecordedEventAttributes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          marker_name: String.t(),
          details: %{String.t() => Temporal.Api.Common.V1.Payloads.t() | nil},
          workflow_task_completed_event_id: integer,
          header: Temporal.Api.Common.V1.Header.t() | nil,
          failure: Temporal.Api.Failure.V1.Failure.t() | nil
        }

  defstruct marker_name: "",
            details: %{},
            workflow_task_completed_event_id: 0,
            header: nil,
            failure: nil

  field :marker_name, 1, type: :string, json_name: "markerName"

  field :details, 2,
    repeated: true,
    type: Temporal.Api.History.V1.MarkerRecordedEventAttributes.DetailsEntry,
    map: true

  field :workflow_task_completed_event_id, 3,
    type: :int64,
    json_name: "workflowTaskCompletedEventId"

  field :header, 4, type: Temporal.Api.Common.V1.Header
  field :failure, 5, type: Temporal.Api.Failure.V1.Failure
end
defmodule Temporal.Api.History.V1.WorkflowExecutionSignaledEventAttributes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          signal_name: String.t(),
          input: Temporal.Api.Common.V1.Payloads.t() | nil,
          identity: String.t(),
          header: Temporal.Api.Common.V1.Header.t() | nil
        }

  defstruct signal_name: "",
            input: nil,
            identity: "",
            header: nil

  field :signal_name, 1, type: :string, json_name: "signalName"
  field :input, 2, type: Temporal.Api.Common.V1.Payloads
  field :identity, 3, type: :string
  field :header, 4, type: Temporal.Api.Common.V1.Header
end
defmodule Temporal.Api.History.V1.WorkflowExecutionTerminatedEventAttributes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          reason: String.t(),
          details: Temporal.Api.Common.V1.Payloads.t() | nil,
          identity: String.t()
        }

  defstruct reason: "",
            details: nil,
            identity: ""

  field :reason, 1, type: :string
  field :details, 2, type: Temporal.Api.Common.V1.Payloads
  field :identity, 3, type: :string
end
defmodule Temporal.Api.History.V1.RequestCancelExternalWorkflowExecutionInitiatedEventAttributes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          workflow_task_completed_event_id: integer,
          namespace: String.t(),
          workflow_execution: Temporal.Api.Common.V1.WorkflowExecution.t() | nil,
          control: String.t(),
          child_workflow_only: boolean
        }

  defstruct workflow_task_completed_event_id: 0,
            namespace: "",
            workflow_execution: nil,
            control: "",
            child_workflow_only: false

  field :workflow_task_completed_event_id, 1,
    type: :int64,
    json_name: "workflowTaskCompletedEventId"

  field :namespace, 2, type: :string

  field :workflow_execution, 3,
    type: Temporal.Api.Common.V1.WorkflowExecution,
    json_name: "workflowExecution"

  field :control, 4, type: :string
  field :child_workflow_only, 5, type: :bool, json_name: "childWorkflowOnly"
end
defmodule Temporal.Api.History.V1.RequestCancelExternalWorkflowExecutionFailedEventAttributes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          cause: Temporal.Api.Enums.V1.CancelExternalWorkflowExecutionFailedCause.t(),
          workflow_task_completed_event_id: integer,
          namespace: String.t(),
          workflow_execution: Temporal.Api.Common.V1.WorkflowExecution.t() | nil,
          initiated_event_id: integer,
          control: String.t()
        }

  defstruct cause: :CANCEL_EXTERNAL_WORKFLOW_EXECUTION_FAILED_CAUSE_UNSPECIFIED,
            workflow_task_completed_event_id: 0,
            namespace: "",
            workflow_execution: nil,
            initiated_event_id: 0,
            control: ""

  field :cause, 1,
    type: Temporal.Api.Enums.V1.CancelExternalWorkflowExecutionFailedCause,
    enum: true

  field :workflow_task_completed_event_id, 2,
    type: :int64,
    json_name: "workflowTaskCompletedEventId"

  field :namespace, 3, type: :string

  field :workflow_execution, 4,
    type: Temporal.Api.Common.V1.WorkflowExecution,
    json_name: "workflowExecution"

  field :initiated_event_id, 5, type: :int64, json_name: "initiatedEventId"
  field :control, 6, type: :string
end
defmodule Temporal.Api.History.V1.ExternalWorkflowExecutionCancelRequestedEventAttributes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          initiated_event_id: integer,
          namespace: String.t(),
          workflow_execution: Temporal.Api.Common.V1.WorkflowExecution.t() | nil
        }

  defstruct initiated_event_id: 0,
            namespace: "",
            workflow_execution: nil

  field :initiated_event_id, 1, type: :int64, json_name: "initiatedEventId"
  field :namespace, 2, type: :string

  field :workflow_execution, 3,
    type: Temporal.Api.Common.V1.WorkflowExecution,
    json_name: "workflowExecution"
end
defmodule Temporal.Api.History.V1.SignalExternalWorkflowExecutionInitiatedEventAttributes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          workflow_task_completed_event_id: integer,
          namespace: String.t(),
          workflow_execution: Temporal.Api.Common.V1.WorkflowExecution.t() | nil,
          signal_name: String.t(),
          input: Temporal.Api.Common.V1.Payloads.t() | nil,
          control: String.t(),
          child_workflow_only: boolean,
          header: Temporal.Api.Common.V1.Header.t() | nil
        }

  defstruct workflow_task_completed_event_id: 0,
            namespace: "",
            workflow_execution: nil,
            signal_name: "",
            input: nil,
            control: "",
            child_workflow_only: false,
            header: nil

  field :workflow_task_completed_event_id, 1,
    type: :int64,
    json_name: "workflowTaskCompletedEventId"

  field :namespace, 2, type: :string

  field :workflow_execution, 3,
    type: Temporal.Api.Common.V1.WorkflowExecution,
    json_name: "workflowExecution"

  field :signal_name, 4, type: :string, json_name: "signalName"
  field :input, 5, type: Temporal.Api.Common.V1.Payloads
  field :control, 6, type: :string
  field :child_workflow_only, 7, type: :bool, json_name: "childWorkflowOnly"
  field :header, 8, type: Temporal.Api.Common.V1.Header
end
defmodule Temporal.Api.History.V1.SignalExternalWorkflowExecutionFailedEventAttributes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          cause: Temporal.Api.Enums.V1.SignalExternalWorkflowExecutionFailedCause.t(),
          workflow_task_completed_event_id: integer,
          namespace: String.t(),
          workflow_execution: Temporal.Api.Common.V1.WorkflowExecution.t() | nil,
          initiated_event_id: integer,
          control: String.t()
        }

  defstruct cause: :SIGNAL_EXTERNAL_WORKFLOW_EXECUTION_FAILED_CAUSE_UNSPECIFIED,
            workflow_task_completed_event_id: 0,
            namespace: "",
            workflow_execution: nil,
            initiated_event_id: 0,
            control: ""

  field :cause, 1,
    type: Temporal.Api.Enums.V1.SignalExternalWorkflowExecutionFailedCause,
    enum: true

  field :workflow_task_completed_event_id, 2,
    type: :int64,
    json_name: "workflowTaskCompletedEventId"

  field :namespace, 3, type: :string

  field :workflow_execution, 4,
    type: Temporal.Api.Common.V1.WorkflowExecution,
    json_name: "workflowExecution"

  field :initiated_event_id, 5, type: :int64, json_name: "initiatedEventId"
  field :control, 6, type: :string
end
defmodule Temporal.Api.History.V1.ExternalWorkflowExecutionSignaledEventAttributes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          initiated_event_id: integer,
          namespace: String.t(),
          workflow_execution: Temporal.Api.Common.V1.WorkflowExecution.t() | nil,
          control: String.t()
        }

  defstruct initiated_event_id: 0,
            namespace: "",
            workflow_execution: nil,
            control: ""

  field :initiated_event_id, 1, type: :int64, json_name: "initiatedEventId"
  field :namespace, 2, type: :string

  field :workflow_execution, 3,
    type: Temporal.Api.Common.V1.WorkflowExecution,
    json_name: "workflowExecution"

  field :control, 4, type: :string
end
defmodule Temporal.Api.History.V1.UpsertWorkflowSearchAttributesEventAttributes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          workflow_task_completed_event_id: integer,
          search_attributes: Temporal.Api.Common.V1.SearchAttributes.t() | nil
        }

  defstruct workflow_task_completed_event_id: 0,
            search_attributes: nil

  field :workflow_task_completed_event_id, 1,
    type: :int64,
    json_name: "workflowTaskCompletedEventId"

  field :search_attributes, 2,
    type: Temporal.Api.Common.V1.SearchAttributes,
    json_name: "searchAttributes"
end
defmodule Temporal.Api.History.V1.StartChildWorkflowExecutionInitiatedEventAttributes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          namespace: String.t(),
          workflow_id: String.t(),
          workflow_type: Temporal.Api.Common.V1.WorkflowType.t() | nil,
          task_queue: Temporal.Api.Taskqueue.V1.TaskQueue.t() | nil,
          input: Temporal.Api.Common.V1.Payloads.t() | nil,
          workflow_execution_timeout: Google.Protobuf.Duration.t() | nil,
          workflow_run_timeout: Google.Protobuf.Duration.t() | nil,
          workflow_task_timeout: Google.Protobuf.Duration.t() | nil,
          parent_close_policy: Temporal.Api.Enums.V1.ParentClosePolicy.t(),
          control: String.t(),
          workflow_task_completed_event_id: integer,
          workflow_id_reuse_policy: Temporal.Api.Enums.V1.WorkflowIdReusePolicy.t(),
          retry_policy: Temporal.Api.Common.V1.RetryPolicy.t() | nil,
          cron_schedule: String.t(),
          header: Temporal.Api.Common.V1.Header.t() | nil,
          memo: Temporal.Api.Common.V1.Memo.t() | nil,
          search_attributes: Temporal.Api.Common.V1.SearchAttributes.t() | nil
        }

  defstruct namespace: "",
            workflow_id: "",
            workflow_type: nil,
            task_queue: nil,
            input: nil,
            workflow_execution_timeout: nil,
            workflow_run_timeout: nil,
            workflow_task_timeout: nil,
            parent_close_policy: :PARENT_CLOSE_POLICY_UNSPECIFIED,
            control: "",
            workflow_task_completed_event_id: 0,
            workflow_id_reuse_policy: :WORKFLOW_ID_REUSE_POLICY_UNSPECIFIED,
            retry_policy: nil,
            cron_schedule: "",
            header: nil,
            memo: nil,
            search_attributes: nil

  field :namespace, 1, type: :string
  field :workflow_id, 2, type: :string, json_name: "workflowId"
  field :workflow_type, 3, type: Temporal.Api.Common.V1.WorkflowType, json_name: "workflowType"
  field :task_queue, 4, type: Temporal.Api.Taskqueue.V1.TaskQueue, json_name: "taskQueue"
  field :input, 5, type: Temporal.Api.Common.V1.Payloads

  field :workflow_execution_timeout, 6,
    type: Google.Protobuf.Duration,
    json_name: "workflowExecutionTimeout",
    deprecated: false

  field :workflow_run_timeout, 7,
    type: Google.Protobuf.Duration,
    json_name: "workflowRunTimeout",
    deprecated: false

  field :workflow_task_timeout, 8,
    type: Google.Protobuf.Duration,
    json_name: "workflowTaskTimeout",
    deprecated: false

  field :parent_close_policy, 9,
    type: Temporal.Api.Enums.V1.ParentClosePolicy,
    json_name: "parentClosePolicy",
    enum: true

  field :control, 10, type: :string

  field :workflow_task_completed_event_id, 11,
    type: :int64,
    json_name: "workflowTaskCompletedEventId"

  field :workflow_id_reuse_policy, 12,
    type: Temporal.Api.Enums.V1.WorkflowIdReusePolicy,
    json_name: "workflowIdReusePolicy",
    enum: true

  field :retry_policy, 13, type: Temporal.Api.Common.V1.RetryPolicy, json_name: "retryPolicy"
  field :cron_schedule, 14, type: :string, json_name: "cronSchedule"
  field :header, 15, type: Temporal.Api.Common.V1.Header
  field :memo, 16, type: Temporal.Api.Common.V1.Memo

  field :search_attributes, 17,
    type: Temporal.Api.Common.V1.SearchAttributes,
    json_name: "searchAttributes"
end
defmodule Temporal.Api.History.V1.StartChildWorkflowExecutionFailedEventAttributes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          namespace: String.t(),
          workflow_id: String.t(),
          workflow_type: Temporal.Api.Common.V1.WorkflowType.t() | nil,
          cause: Temporal.Api.Enums.V1.StartChildWorkflowExecutionFailedCause.t(),
          control: String.t(),
          initiated_event_id: integer,
          workflow_task_completed_event_id: integer
        }

  defstruct namespace: "",
            workflow_id: "",
            workflow_type: nil,
            cause: :START_CHILD_WORKFLOW_EXECUTION_FAILED_CAUSE_UNSPECIFIED,
            control: "",
            initiated_event_id: 0,
            workflow_task_completed_event_id: 0

  field :namespace, 1, type: :string
  field :workflow_id, 2, type: :string, json_name: "workflowId"
  field :workflow_type, 3, type: Temporal.Api.Common.V1.WorkflowType, json_name: "workflowType"
  field :cause, 4, type: Temporal.Api.Enums.V1.StartChildWorkflowExecutionFailedCause, enum: true
  field :control, 5, type: :string
  field :initiated_event_id, 6, type: :int64, json_name: "initiatedEventId"

  field :workflow_task_completed_event_id, 7,
    type: :int64,
    json_name: "workflowTaskCompletedEventId"
end
defmodule Temporal.Api.History.V1.ChildWorkflowExecutionStartedEventAttributes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          namespace: String.t(),
          initiated_event_id: integer,
          workflow_execution: Temporal.Api.Common.V1.WorkflowExecution.t() | nil,
          workflow_type: Temporal.Api.Common.V1.WorkflowType.t() | nil,
          header: Temporal.Api.Common.V1.Header.t() | nil
        }

  defstruct namespace: "",
            initiated_event_id: 0,
            workflow_execution: nil,
            workflow_type: nil,
            header: nil

  field :namespace, 1, type: :string
  field :initiated_event_id, 2, type: :int64, json_name: "initiatedEventId"

  field :workflow_execution, 3,
    type: Temporal.Api.Common.V1.WorkflowExecution,
    json_name: "workflowExecution"

  field :workflow_type, 4, type: Temporal.Api.Common.V1.WorkflowType, json_name: "workflowType"
  field :header, 5, type: Temporal.Api.Common.V1.Header
end
defmodule Temporal.Api.History.V1.ChildWorkflowExecutionCompletedEventAttributes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          result: Temporal.Api.Common.V1.Payloads.t() | nil,
          namespace: String.t(),
          workflow_execution: Temporal.Api.Common.V1.WorkflowExecution.t() | nil,
          workflow_type: Temporal.Api.Common.V1.WorkflowType.t() | nil,
          initiated_event_id: integer,
          started_event_id: integer
        }

  defstruct result: nil,
            namespace: "",
            workflow_execution: nil,
            workflow_type: nil,
            initiated_event_id: 0,
            started_event_id: 0

  field :result, 1, type: Temporal.Api.Common.V1.Payloads
  field :namespace, 2, type: :string

  field :workflow_execution, 3,
    type: Temporal.Api.Common.V1.WorkflowExecution,
    json_name: "workflowExecution"

  field :workflow_type, 4, type: Temporal.Api.Common.V1.WorkflowType, json_name: "workflowType"
  field :initiated_event_id, 5, type: :int64, json_name: "initiatedEventId"
  field :started_event_id, 6, type: :int64, json_name: "startedEventId"
end
defmodule Temporal.Api.History.V1.ChildWorkflowExecutionFailedEventAttributes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          failure: Temporal.Api.Failure.V1.Failure.t() | nil,
          namespace: String.t(),
          workflow_execution: Temporal.Api.Common.V1.WorkflowExecution.t() | nil,
          workflow_type: Temporal.Api.Common.V1.WorkflowType.t() | nil,
          initiated_event_id: integer,
          started_event_id: integer,
          retry_state: Temporal.Api.Enums.V1.RetryState.t()
        }

  defstruct failure: nil,
            namespace: "",
            workflow_execution: nil,
            workflow_type: nil,
            initiated_event_id: 0,
            started_event_id: 0,
            retry_state: :RETRY_STATE_UNSPECIFIED

  field :failure, 1, type: Temporal.Api.Failure.V1.Failure
  field :namespace, 2, type: :string

  field :workflow_execution, 3,
    type: Temporal.Api.Common.V1.WorkflowExecution,
    json_name: "workflowExecution"

  field :workflow_type, 4, type: Temporal.Api.Common.V1.WorkflowType, json_name: "workflowType"
  field :initiated_event_id, 5, type: :int64, json_name: "initiatedEventId"
  field :started_event_id, 6, type: :int64, json_name: "startedEventId"

  field :retry_state, 7,
    type: Temporal.Api.Enums.V1.RetryState,
    json_name: "retryState",
    enum: true
end
defmodule Temporal.Api.History.V1.ChildWorkflowExecutionCanceledEventAttributes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          details: Temporal.Api.Common.V1.Payloads.t() | nil,
          namespace: String.t(),
          workflow_execution: Temporal.Api.Common.V1.WorkflowExecution.t() | nil,
          workflow_type: Temporal.Api.Common.V1.WorkflowType.t() | nil,
          initiated_event_id: integer,
          started_event_id: integer
        }

  defstruct details: nil,
            namespace: "",
            workflow_execution: nil,
            workflow_type: nil,
            initiated_event_id: 0,
            started_event_id: 0

  field :details, 1, type: Temporal.Api.Common.V1.Payloads
  field :namespace, 2, type: :string

  field :workflow_execution, 3,
    type: Temporal.Api.Common.V1.WorkflowExecution,
    json_name: "workflowExecution"

  field :workflow_type, 4, type: Temporal.Api.Common.V1.WorkflowType, json_name: "workflowType"
  field :initiated_event_id, 5, type: :int64, json_name: "initiatedEventId"
  field :started_event_id, 6, type: :int64, json_name: "startedEventId"
end
defmodule Temporal.Api.History.V1.ChildWorkflowExecutionTimedOutEventAttributes do
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
defmodule Temporal.Api.History.V1.ChildWorkflowExecutionTerminatedEventAttributes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          namespace: String.t(),
          workflow_execution: Temporal.Api.Common.V1.WorkflowExecution.t() | nil,
          workflow_type: Temporal.Api.Common.V1.WorkflowType.t() | nil,
          initiated_event_id: integer,
          started_event_id: integer
        }

  defstruct namespace: "",
            workflow_execution: nil,
            workflow_type: nil,
            initiated_event_id: 0,
            started_event_id: 0

  field :namespace, 1, type: :string

  field :workflow_execution, 2,
    type: Temporal.Api.Common.V1.WorkflowExecution,
    json_name: "workflowExecution"

  field :workflow_type, 3, type: Temporal.Api.Common.V1.WorkflowType, json_name: "workflowType"
  field :initiated_event_id, 4, type: :int64, json_name: "initiatedEventId"
  field :started_event_id, 5, type: :int64, json_name: "startedEventId"
end
defmodule Temporal.Api.History.V1.HistoryEvent do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          attributes:
            {:workflow_execution_started_event_attributes,
             Temporal.Api.History.V1.WorkflowExecutionStartedEventAttributes.t() | nil}
            | {:workflow_execution_completed_event_attributes,
               Temporal.Api.History.V1.WorkflowExecutionCompletedEventAttributes.t() | nil}
            | {:workflow_execution_failed_event_attributes,
               Temporal.Api.History.V1.WorkflowExecutionFailedEventAttributes.t() | nil}
            | {:workflow_execution_timed_out_event_attributes,
               Temporal.Api.History.V1.WorkflowExecutionTimedOutEventAttributes.t() | nil}
            | {:workflow_task_scheduled_event_attributes,
               Temporal.Api.History.V1.WorkflowTaskScheduledEventAttributes.t() | nil}
            | {:workflow_task_started_event_attributes,
               Temporal.Api.History.V1.WorkflowTaskStartedEventAttributes.t() | nil}
            | {:workflow_task_completed_event_attributes,
               Temporal.Api.History.V1.WorkflowTaskCompletedEventAttributes.t() | nil}
            | {:workflow_task_timed_out_event_attributes,
               Temporal.Api.History.V1.WorkflowTaskTimedOutEventAttributes.t() | nil}
            | {:workflow_task_failed_event_attributes,
               Temporal.Api.History.V1.WorkflowTaskFailedEventAttributes.t() | nil}
            | {:activity_task_scheduled_event_attributes,
               Temporal.Api.History.V1.ActivityTaskScheduledEventAttributes.t() | nil}
            | {:activity_task_started_event_attributes,
               Temporal.Api.History.V1.ActivityTaskStartedEventAttributes.t() | nil}
            | {:activity_task_completed_event_attributes,
               Temporal.Api.History.V1.ActivityTaskCompletedEventAttributes.t() | nil}
            | {:activity_task_failed_event_attributes,
               Temporal.Api.History.V1.ActivityTaskFailedEventAttributes.t() | nil}
            | {:activity_task_timed_out_event_attributes,
               Temporal.Api.History.V1.ActivityTaskTimedOutEventAttributes.t() | nil}
            | {:timer_started_event_attributes,
               Temporal.Api.History.V1.TimerStartedEventAttributes.t() | nil}
            | {:timer_fired_event_attributes,
               Temporal.Api.History.V1.TimerFiredEventAttributes.t() | nil}
            | {:activity_task_cancel_requested_event_attributes,
               Temporal.Api.History.V1.ActivityTaskCancelRequestedEventAttributes.t() | nil}
            | {:activity_task_canceled_event_attributes,
               Temporal.Api.History.V1.ActivityTaskCanceledEventAttributes.t() | nil}
            | {:timer_canceled_event_attributes,
               Temporal.Api.History.V1.TimerCanceledEventAttributes.t() | nil}
            | {:marker_recorded_event_attributes,
               Temporal.Api.History.V1.MarkerRecordedEventAttributes.t() | nil}
            | {:workflow_execution_signaled_event_attributes,
               Temporal.Api.History.V1.WorkflowExecutionSignaledEventAttributes.t() | nil}
            | {:workflow_execution_terminated_event_attributes,
               Temporal.Api.History.V1.WorkflowExecutionTerminatedEventAttributes.t() | nil}
            | {:workflow_execution_cancel_requested_event_attributes,
               Temporal.Api.History.V1.WorkflowExecutionCancelRequestedEventAttributes.t() | nil}
            | {:workflow_execution_canceled_event_attributes,
               Temporal.Api.History.V1.WorkflowExecutionCanceledEventAttributes.t() | nil}
            | {:request_cancel_external_workflow_execution_initiated_event_attributes,
               Temporal.Api.History.V1.RequestCancelExternalWorkflowExecutionInitiatedEventAttributes.t()
               | nil}
            | {:request_cancel_external_workflow_execution_failed_event_attributes,
               Temporal.Api.History.V1.RequestCancelExternalWorkflowExecutionFailedEventAttributes.t()
               | nil}
            | {:external_workflow_execution_cancel_requested_event_attributes,
               Temporal.Api.History.V1.ExternalWorkflowExecutionCancelRequestedEventAttributes.t()
               | nil}
            | {:workflow_execution_continued_as_new_event_attributes,
               Temporal.Api.History.V1.WorkflowExecutionContinuedAsNewEventAttributes.t() | nil}
            | {:start_child_workflow_execution_initiated_event_attributes,
               Temporal.Api.History.V1.StartChildWorkflowExecutionInitiatedEventAttributes.t()
               | nil}
            | {:start_child_workflow_execution_failed_event_attributes,
               Temporal.Api.History.V1.StartChildWorkflowExecutionFailedEventAttributes.t() | nil}
            | {:child_workflow_execution_started_event_attributes,
               Temporal.Api.History.V1.ChildWorkflowExecutionStartedEventAttributes.t() | nil}
            | {:child_workflow_execution_completed_event_attributes,
               Temporal.Api.History.V1.ChildWorkflowExecutionCompletedEventAttributes.t() | nil}
            | {:child_workflow_execution_failed_event_attributes,
               Temporal.Api.History.V1.ChildWorkflowExecutionFailedEventAttributes.t() | nil}
            | {:child_workflow_execution_canceled_event_attributes,
               Temporal.Api.History.V1.ChildWorkflowExecutionCanceledEventAttributes.t() | nil}
            | {:child_workflow_execution_timed_out_event_attributes,
               Temporal.Api.History.V1.ChildWorkflowExecutionTimedOutEventAttributes.t() | nil}
            | {:child_workflow_execution_terminated_event_attributes,
               Temporal.Api.History.V1.ChildWorkflowExecutionTerminatedEventAttributes.t() | nil}
            | {:signal_external_workflow_execution_initiated_event_attributes,
               Temporal.Api.History.V1.SignalExternalWorkflowExecutionInitiatedEventAttributes.t()
               | nil}
            | {:signal_external_workflow_execution_failed_event_attributes,
               Temporal.Api.History.V1.SignalExternalWorkflowExecutionFailedEventAttributes.t()
               | nil}
            | {:external_workflow_execution_signaled_event_attributes,
               Temporal.Api.History.V1.ExternalWorkflowExecutionSignaledEventAttributes.t() | nil}
            | {:upsert_workflow_search_attributes_event_attributes,
               Temporal.Api.History.V1.UpsertWorkflowSearchAttributesEventAttributes.t() | nil},
          event_id: integer,
          event_time: Google.Protobuf.Timestamp.t() | nil,
          event_type: Temporal.Api.Enums.V1.EventType.t(),
          version: integer,
          task_id: integer
        }

  defstruct attributes: nil,
            event_id: 0,
            event_time: nil,
            event_type: :EVENT_TYPE_UNSPECIFIED,
            version: 0,
            task_id: 0

  oneof :attributes, 0

  field :event_id, 1, type: :int64, json_name: "eventId"
  field :event_time, 2, type: Google.Protobuf.Timestamp, json_name: "eventTime", deprecated: false
  field :event_type, 3, type: Temporal.Api.Enums.V1.EventType, json_name: "eventType", enum: true
  field :version, 4, type: :int64
  field :task_id, 5, type: :int64, json_name: "taskId"

  field :workflow_execution_started_event_attributes, 6,
    type: Temporal.Api.History.V1.WorkflowExecutionStartedEventAttributes,
    json_name: "workflowExecutionStartedEventAttributes",
    oneof: 0

  field :workflow_execution_completed_event_attributes, 7,
    type: Temporal.Api.History.V1.WorkflowExecutionCompletedEventAttributes,
    json_name: "workflowExecutionCompletedEventAttributes",
    oneof: 0

  field :workflow_execution_failed_event_attributes, 8,
    type: Temporal.Api.History.V1.WorkflowExecutionFailedEventAttributes,
    json_name: "workflowExecutionFailedEventAttributes",
    oneof: 0

  field :workflow_execution_timed_out_event_attributes, 9,
    type: Temporal.Api.History.V1.WorkflowExecutionTimedOutEventAttributes,
    json_name: "workflowExecutionTimedOutEventAttributes",
    oneof: 0

  field :workflow_task_scheduled_event_attributes, 10,
    type: Temporal.Api.History.V1.WorkflowTaskScheduledEventAttributes,
    json_name: "workflowTaskScheduledEventAttributes",
    oneof: 0

  field :workflow_task_started_event_attributes, 11,
    type: Temporal.Api.History.V1.WorkflowTaskStartedEventAttributes,
    json_name: "workflowTaskStartedEventAttributes",
    oneof: 0

  field :workflow_task_completed_event_attributes, 12,
    type: Temporal.Api.History.V1.WorkflowTaskCompletedEventAttributes,
    json_name: "workflowTaskCompletedEventAttributes",
    oneof: 0

  field :workflow_task_timed_out_event_attributes, 13,
    type: Temporal.Api.History.V1.WorkflowTaskTimedOutEventAttributes,
    json_name: "workflowTaskTimedOutEventAttributes",
    oneof: 0

  field :workflow_task_failed_event_attributes, 14,
    type: Temporal.Api.History.V1.WorkflowTaskFailedEventAttributes,
    json_name: "workflowTaskFailedEventAttributes",
    oneof: 0

  field :activity_task_scheduled_event_attributes, 15,
    type: Temporal.Api.History.V1.ActivityTaskScheduledEventAttributes,
    json_name: "activityTaskScheduledEventAttributes",
    oneof: 0

  field :activity_task_started_event_attributes, 16,
    type: Temporal.Api.History.V1.ActivityTaskStartedEventAttributes,
    json_name: "activityTaskStartedEventAttributes",
    oneof: 0

  field :activity_task_completed_event_attributes, 17,
    type: Temporal.Api.History.V1.ActivityTaskCompletedEventAttributes,
    json_name: "activityTaskCompletedEventAttributes",
    oneof: 0

  field :activity_task_failed_event_attributes, 18,
    type: Temporal.Api.History.V1.ActivityTaskFailedEventAttributes,
    json_name: "activityTaskFailedEventAttributes",
    oneof: 0

  field :activity_task_timed_out_event_attributes, 19,
    type: Temporal.Api.History.V1.ActivityTaskTimedOutEventAttributes,
    json_name: "activityTaskTimedOutEventAttributes",
    oneof: 0

  field :timer_started_event_attributes, 20,
    type: Temporal.Api.History.V1.TimerStartedEventAttributes,
    json_name: "timerStartedEventAttributes",
    oneof: 0

  field :timer_fired_event_attributes, 21,
    type: Temporal.Api.History.V1.TimerFiredEventAttributes,
    json_name: "timerFiredEventAttributes",
    oneof: 0

  field :activity_task_cancel_requested_event_attributes, 22,
    type: Temporal.Api.History.V1.ActivityTaskCancelRequestedEventAttributes,
    json_name: "activityTaskCancelRequestedEventAttributes",
    oneof: 0

  field :activity_task_canceled_event_attributes, 23,
    type: Temporal.Api.History.V1.ActivityTaskCanceledEventAttributes,
    json_name: "activityTaskCanceledEventAttributes",
    oneof: 0

  field :timer_canceled_event_attributes, 24,
    type: Temporal.Api.History.V1.TimerCanceledEventAttributes,
    json_name: "timerCanceledEventAttributes",
    oneof: 0

  field :marker_recorded_event_attributes, 25,
    type: Temporal.Api.History.V1.MarkerRecordedEventAttributes,
    json_name: "markerRecordedEventAttributes",
    oneof: 0

  field :workflow_execution_signaled_event_attributes, 26,
    type: Temporal.Api.History.V1.WorkflowExecutionSignaledEventAttributes,
    json_name: "workflowExecutionSignaledEventAttributes",
    oneof: 0

  field :workflow_execution_terminated_event_attributes, 27,
    type: Temporal.Api.History.V1.WorkflowExecutionTerminatedEventAttributes,
    json_name: "workflowExecutionTerminatedEventAttributes",
    oneof: 0

  field :workflow_execution_cancel_requested_event_attributes, 28,
    type: Temporal.Api.History.V1.WorkflowExecutionCancelRequestedEventAttributes,
    json_name: "workflowExecutionCancelRequestedEventAttributes",
    oneof: 0

  field :workflow_execution_canceled_event_attributes, 29,
    type: Temporal.Api.History.V1.WorkflowExecutionCanceledEventAttributes,
    json_name: "workflowExecutionCanceledEventAttributes",
    oneof: 0

  field :request_cancel_external_workflow_execution_initiated_event_attributes, 30,
    type: Temporal.Api.History.V1.RequestCancelExternalWorkflowExecutionInitiatedEventAttributes,
    json_name: "requestCancelExternalWorkflowExecutionInitiatedEventAttributes",
    oneof: 0

  field :request_cancel_external_workflow_execution_failed_event_attributes, 31,
    type: Temporal.Api.History.V1.RequestCancelExternalWorkflowExecutionFailedEventAttributes,
    json_name: "requestCancelExternalWorkflowExecutionFailedEventAttributes",
    oneof: 0

  field :external_workflow_execution_cancel_requested_event_attributes, 32,
    type: Temporal.Api.History.V1.ExternalWorkflowExecutionCancelRequestedEventAttributes,
    json_name: "externalWorkflowExecutionCancelRequestedEventAttributes",
    oneof: 0

  field :workflow_execution_continued_as_new_event_attributes, 33,
    type: Temporal.Api.History.V1.WorkflowExecutionContinuedAsNewEventAttributes,
    json_name: "workflowExecutionContinuedAsNewEventAttributes",
    oneof: 0

  field :start_child_workflow_execution_initiated_event_attributes, 34,
    type: Temporal.Api.History.V1.StartChildWorkflowExecutionInitiatedEventAttributes,
    json_name: "startChildWorkflowExecutionInitiatedEventAttributes",
    oneof: 0

  field :start_child_workflow_execution_failed_event_attributes, 35,
    type: Temporal.Api.History.V1.StartChildWorkflowExecutionFailedEventAttributes,
    json_name: "startChildWorkflowExecutionFailedEventAttributes",
    oneof: 0

  field :child_workflow_execution_started_event_attributes, 36,
    type: Temporal.Api.History.V1.ChildWorkflowExecutionStartedEventAttributes,
    json_name: "childWorkflowExecutionStartedEventAttributes",
    oneof: 0

  field :child_workflow_execution_completed_event_attributes, 37,
    type: Temporal.Api.History.V1.ChildWorkflowExecutionCompletedEventAttributes,
    json_name: "childWorkflowExecutionCompletedEventAttributes",
    oneof: 0

  field :child_workflow_execution_failed_event_attributes, 38,
    type: Temporal.Api.History.V1.ChildWorkflowExecutionFailedEventAttributes,
    json_name: "childWorkflowExecutionFailedEventAttributes",
    oneof: 0

  field :child_workflow_execution_canceled_event_attributes, 39,
    type: Temporal.Api.History.V1.ChildWorkflowExecutionCanceledEventAttributes,
    json_name: "childWorkflowExecutionCanceledEventAttributes",
    oneof: 0

  field :child_workflow_execution_timed_out_event_attributes, 40,
    type: Temporal.Api.History.V1.ChildWorkflowExecutionTimedOutEventAttributes,
    json_name: "childWorkflowExecutionTimedOutEventAttributes",
    oneof: 0

  field :child_workflow_execution_terminated_event_attributes, 41,
    type: Temporal.Api.History.V1.ChildWorkflowExecutionTerminatedEventAttributes,
    json_name: "childWorkflowExecutionTerminatedEventAttributes",
    oneof: 0

  field :signal_external_workflow_execution_initiated_event_attributes, 42,
    type: Temporal.Api.History.V1.SignalExternalWorkflowExecutionInitiatedEventAttributes,
    json_name: "signalExternalWorkflowExecutionInitiatedEventAttributes",
    oneof: 0

  field :signal_external_workflow_execution_failed_event_attributes, 43,
    type: Temporal.Api.History.V1.SignalExternalWorkflowExecutionFailedEventAttributes,
    json_name: "signalExternalWorkflowExecutionFailedEventAttributes",
    oneof: 0

  field :external_workflow_execution_signaled_event_attributes, 44,
    type: Temporal.Api.History.V1.ExternalWorkflowExecutionSignaledEventAttributes,
    json_name: "externalWorkflowExecutionSignaledEventAttributes",
    oneof: 0

  field :upsert_workflow_search_attributes_event_attributes, 45,
    type: Temporal.Api.History.V1.UpsertWorkflowSearchAttributesEventAttributes,
    json_name: "upsertWorkflowSearchAttributesEventAttributes",
    oneof: 0
end
defmodule Temporal.Api.History.V1.History do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          events: [Temporal.Api.History.V1.HistoryEvent.t()]
        }

  defstruct events: []

  field :events, 1, repeated: true, type: Temporal.Api.History.V1.HistoryEvent
end

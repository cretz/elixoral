defmodule Temporal.Api.Command.V1.ScheduleActivityTaskCommandAttributes do
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

  field :retry_policy, 11, type: Temporal.Api.Common.V1.RetryPolicy, json_name: "retryPolicy"
end
defmodule Temporal.Api.Command.V1.RequestCancelActivityTaskCommandAttributes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          scheduled_event_id: integer
        }

  defstruct scheduled_event_id: 0

  field :scheduled_event_id, 1, type: :int64, json_name: "scheduledEventId"
end
defmodule Temporal.Api.Command.V1.StartTimerCommandAttributes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          timer_id: String.t(),
          start_to_fire_timeout: Google.Protobuf.Duration.t() | nil
        }

  defstruct timer_id: "",
            start_to_fire_timeout: nil

  field :timer_id, 1, type: :string, json_name: "timerId"

  field :start_to_fire_timeout, 2,
    type: Google.Protobuf.Duration,
    json_name: "startToFireTimeout",
    deprecated: false
end
defmodule Temporal.Api.Command.V1.CompleteWorkflowExecutionCommandAttributes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          result: Temporal.Api.Common.V1.Payloads.t() | nil
        }

  defstruct result: nil

  field :result, 1, type: Temporal.Api.Common.V1.Payloads
end
defmodule Temporal.Api.Command.V1.FailWorkflowExecutionCommandAttributes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          failure: Temporal.Api.Failure.V1.Failure.t() | nil
        }

  defstruct failure: nil

  field :failure, 1, type: Temporal.Api.Failure.V1.Failure
end
defmodule Temporal.Api.Command.V1.CancelTimerCommandAttributes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          timer_id: String.t()
        }

  defstruct timer_id: ""

  field :timer_id, 1, type: :string, json_name: "timerId"
end
defmodule Temporal.Api.Command.V1.CancelWorkflowExecutionCommandAttributes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          details: Temporal.Api.Common.V1.Payloads.t() | nil
        }

  defstruct details: nil

  field :details, 1, type: Temporal.Api.Common.V1.Payloads
end
defmodule Temporal.Api.Command.V1.RequestCancelExternalWorkflowExecutionCommandAttributes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          namespace: String.t(),
          workflow_id: String.t(),
          run_id: String.t(),
          control: String.t(),
          child_workflow_only: boolean
        }

  defstruct namespace: "",
            workflow_id: "",
            run_id: "",
            control: "",
            child_workflow_only: false

  field :namespace, 1, type: :string
  field :workflow_id, 2, type: :string, json_name: "workflowId"
  field :run_id, 3, type: :string, json_name: "runId"
  field :control, 4, type: :string
  field :child_workflow_only, 5, type: :bool, json_name: "childWorkflowOnly"
end
defmodule Temporal.Api.Command.V1.SignalExternalWorkflowExecutionCommandAttributes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          namespace: String.t(),
          execution: Temporal.Api.Common.V1.WorkflowExecution.t() | nil,
          signal_name: String.t(),
          input: Temporal.Api.Common.V1.Payloads.t() | nil,
          control: String.t(),
          child_workflow_only: boolean,
          header: Temporal.Api.Common.V1.Header.t() | nil
        }

  defstruct namespace: "",
            execution: nil,
            signal_name: "",
            input: nil,
            control: "",
            child_workflow_only: false,
            header: nil

  field :namespace, 1, type: :string
  field :execution, 2, type: Temporal.Api.Common.V1.WorkflowExecution
  field :signal_name, 3, type: :string, json_name: "signalName"
  field :input, 4, type: Temporal.Api.Common.V1.Payloads
  field :control, 5, type: :string
  field :child_workflow_only, 6, type: :bool, json_name: "childWorkflowOnly"
  field :header, 7, type: Temporal.Api.Common.V1.Header
end
defmodule Temporal.Api.Command.V1.UpsertWorkflowSearchAttributesCommandAttributes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          search_attributes: Temporal.Api.Common.V1.SearchAttributes.t() | nil
        }

  defstruct search_attributes: nil

  field :search_attributes, 1,
    type: Temporal.Api.Common.V1.SearchAttributes,
    json_name: "searchAttributes"
end
defmodule Temporal.Api.Command.V1.RecordMarkerCommandAttributes.DetailsEntry do
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
defmodule Temporal.Api.Command.V1.RecordMarkerCommandAttributes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          marker_name: String.t(),
          details: %{String.t() => Temporal.Api.Common.V1.Payloads.t() | nil},
          header: Temporal.Api.Common.V1.Header.t() | nil,
          failure: Temporal.Api.Failure.V1.Failure.t() | nil
        }

  defstruct marker_name: "",
            details: %{},
            header: nil,
            failure: nil

  field :marker_name, 1, type: :string, json_name: "markerName"

  field :details, 2,
    repeated: true,
    type: Temporal.Api.Command.V1.RecordMarkerCommandAttributes.DetailsEntry,
    map: true

  field :header, 3, type: Temporal.Api.Common.V1.Header
  field :failure, 4, type: Temporal.Api.Failure.V1.Failure
end
defmodule Temporal.Api.Command.V1.ContinueAsNewWorkflowExecutionCommandAttributes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          workflow_type: Temporal.Api.Common.V1.WorkflowType.t() | nil,
          task_queue: Temporal.Api.Taskqueue.V1.TaskQueue.t() | nil,
          input: Temporal.Api.Common.V1.Payloads.t() | nil,
          workflow_run_timeout: Google.Protobuf.Duration.t() | nil,
          workflow_task_timeout: Google.Protobuf.Duration.t() | nil,
          backoff_start_interval: Google.Protobuf.Duration.t() | nil,
          retry_policy: Temporal.Api.Common.V1.RetryPolicy.t() | nil,
          initiator: Temporal.Api.Enums.V1.ContinueAsNewInitiator.t(),
          failure: Temporal.Api.Failure.V1.Failure.t() | nil,
          last_completion_result: Temporal.Api.Common.V1.Payloads.t() | nil,
          cron_schedule: String.t(),
          header: Temporal.Api.Common.V1.Header.t() | nil,
          memo: Temporal.Api.Common.V1.Memo.t() | nil,
          search_attributes: Temporal.Api.Common.V1.SearchAttributes.t() | nil
        }

  defstruct workflow_type: nil,
            task_queue: nil,
            input: nil,
            workflow_run_timeout: nil,
            workflow_task_timeout: nil,
            backoff_start_interval: nil,
            retry_policy: nil,
            initiator: :CONTINUE_AS_NEW_INITIATOR_UNSPECIFIED,
            failure: nil,
            last_completion_result: nil,
            cron_schedule: "",
            header: nil,
            memo: nil,
            search_attributes: nil

  field :workflow_type, 1, type: Temporal.Api.Common.V1.WorkflowType, json_name: "workflowType"
  field :task_queue, 2, type: Temporal.Api.Taskqueue.V1.TaskQueue, json_name: "taskQueue"
  field :input, 3, type: Temporal.Api.Common.V1.Payloads

  field :workflow_run_timeout, 4,
    type: Google.Protobuf.Duration,
    json_name: "workflowRunTimeout",
    deprecated: false

  field :workflow_task_timeout, 5,
    type: Google.Protobuf.Duration,
    json_name: "workflowTaskTimeout",
    deprecated: false

  field :backoff_start_interval, 6,
    type: Google.Protobuf.Duration,
    json_name: "backoffStartInterval",
    deprecated: false

  field :retry_policy, 7, type: Temporal.Api.Common.V1.RetryPolicy, json_name: "retryPolicy"
  field :initiator, 8, type: Temporal.Api.Enums.V1.ContinueAsNewInitiator, enum: true
  field :failure, 9, type: Temporal.Api.Failure.V1.Failure

  field :last_completion_result, 10,
    type: Temporal.Api.Common.V1.Payloads,
    json_name: "lastCompletionResult"

  field :cron_schedule, 11, type: :string, json_name: "cronSchedule"
  field :header, 12, type: Temporal.Api.Common.V1.Header
  field :memo, 13, type: Temporal.Api.Common.V1.Memo

  field :search_attributes, 14,
    type: Temporal.Api.Common.V1.SearchAttributes,
    json_name: "searchAttributes"
end
defmodule Temporal.Api.Command.V1.StartChildWorkflowExecutionCommandAttributes do
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

  field :workflow_id_reuse_policy, 11,
    type: Temporal.Api.Enums.V1.WorkflowIdReusePolicy,
    json_name: "workflowIdReusePolicy",
    enum: true

  field :retry_policy, 12, type: Temporal.Api.Common.V1.RetryPolicy, json_name: "retryPolicy"
  field :cron_schedule, 13, type: :string, json_name: "cronSchedule"
  field :header, 14, type: Temporal.Api.Common.V1.Header
  field :memo, 15, type: Temporal.Api.Common.V1.Memo

  field :search_attributes, 16,
    type: Temporal.Api.Common.V1.SearchAttributes,
    json_name: "searchAttributes"
end
defmodule Temporal.Api.Command.V1.Command do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          attributes:
            {:schedule_activity_task_command_attributes,
             Temporal.Api.Command.V1.ScheduleActivityTaskCommandAttributes.t() | nil}
            | {:start_timer_command_attributes,
               Temporal.Api.Command.V1.StartTimerCommandAttributes.t() | nil}
            | {:complete_workflow_execution_command_attributes,
               Temporal.Api.Command.V1.CompleteWorkflowExecutionCommandAttributes.t() | nil}
            | {:fail_workflow_execution_command_attributes,
               Temporal.Api.Command.V1.FailWorkflowExecutionCommandAttributes.t() | nil}
            | {:request_cancel_activity_task_command_attributes,
               Temporal.Api.Command.V1.RequestCancelActivityTaskCommandAttributes.t() | nil}
            | {:cancel_timer_command_attributes,
               Temporal.Api.Command.V1.CancelTimerCommandAttributes.t() | nil}
            | {:cancel_workflow_execution_command_attributes,
               Temporal.Api.Command.V1.CancelWorkflowExecutionCommandAttributes.t() | nil}
            | {:request_cancel_external_workflow_execution_command_attributes,
               Temporal.Api.Command.V1.RequestCancelExternalWorkflowExecutionCommandAttributes.t()
               | nil}
            | {:record_marker_command_attributes,
               Temporal.Api.Command.V1.RecordMarkerCommandAttributes.t() | nil}
            | {:continue_as_new_workflow_execution_command_attributes,
               Temporal.Api.Command.V1.ContinueAsNewWorkflowExecutionCommandAttributes.t() | nil}
            | {:start_child_workflow_execution_command_attributes,
               Temporal.Api.Command.V1.StartChildWorkflowExecutionCommandAttributes.t() | nil}
            | {:signal_external_workflow_execution_command_attributes,
               Temporal.Api.Command.V1.SignalExternalWorkflowExecutionCommandAttributes.t() | nil}
            | {:upsert_workflow_search_attributes_command_attributes,
               Temporal.Api.Command.V1.UpsertWorkflowSearchAttributesCommandAttributes.t() | nil},
          command_type: Temporal.Api.Enums.V1.CommandType.t()
        }

  defstruct attributes: nil,
            command_type: :COMMAND_TYPE_UNSPECIFIED

  oneof :attributes, 0

  field :command_type, 1,
    type: Temporal.Api.Enums.V1.CommandType,
    json_name: "commandType",
    enum: true

  field :schedule_activity_task_command_attributes, 2,
    type: Temporal.Api.Command.V1.ScheduleActivityTaskCommandAttributes,
    json_name: "scheduleActivityTaskCommandAttributes",
    oneof: 0

  field :start_timer_command_attributes, 3,
    type: Temporal.Api.Command.V1.StartTimerCommandAttributes,
    json_name: "startTimerCommandAttributes",
    oneof: 0

  field :complete_workflow_execution_command_attributes, 4,
    type: Temporal.Api.Command.V1.CompleteWorkflowExecutionCommandAttributes,
    json_name: "completeWorkflowExecutionCommandAttributes",
    oneof: 0

  field :fail_workflow_execution_command_attributes, 5,
    type: Temporal.Api.Command.V1.FailWorkflowExecutionCommandAttributes,
    json_name: "failWorkflowExecutionCommandAttributes",
    oneof: 0

  field :request_cancel_activity_task_command_attributes, 6,
    type: Temporal.Api.Command.V1.RequestCancelActivityTaskCommandAttributes,
    json_name: "requestCancelActivityTaskCommandAttributes",
    oneof: 0

  field :cancel_timer_command_attributes, 7,
    type: Temporal.Api.Command.V1.CancelTimerCommandAttributes,
    json_name: "cancelTimerCommandAttributes",
    oneof: 0

  field :cancel_workflow_execution_command_attributes, 8,
    type: Temporal.Api.Command.V1.CancelWorkflowExecutionCommandAttributes,
    json_name: "cancelWorkflowExecutionCommandAttributes",
    oneof: 0

  field :request_cancel_external_workflow_execution_command_attributes, 9,
    type: Temporal.Api.Command.V1.RequestCancelExternalWorkflowExecutionCommandAttributes,
    json_name: "requestCancelExternalWorkflowExecutionCommandAttributes",
    oneof: 0

  field :record_marker_command_attributes, 10,
    type: Temporal.Api.Command.V1.RecordMarkerCommandAttributes,
    json_name: "recordMarkerCommandAttributes",
    oneof: 0

  field :continue_as_new_workflow_execution_command_attributes, 11,
    type: Temporal.Api.Command.V1.ContinueAsNewWorkflowExecutionCommandAttributes,
    json_name: "continueAsNewWorkflowExecutionCommandAttributes",
    oneof: 0

  field :start_child_workflow_execution_command_attributes, 12,
    type: Temporal.Api.Command.V1.StartChildWorkflowExecutionCommandAttributes,
    json_name: "startChildWorkflowExecutionCommandAttributes",
    oneof: 0

  field :signal_external_workflow_execution_command_attributes, 13,
    type: Temporal.Api.Command.V1.SignalExternalWorkflowExecutionCommandAttributes,
    json_name: "signalExternalWorkflowExecutionCommandAttributes",
    oneof: 0

  field :upsert_workflow_search_attributes_command_attributes, 14,
    type: Temporal.Api.Command.V1.UpsertWorkflowSearchAttributesCommandAttributes,
    json_name: "upsertWorkflowSearchAttributesCommandAttributes",
    oneof: 0
end

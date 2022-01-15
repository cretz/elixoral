defmodule Temporal.Coresdk.WorkflowCommands.ActivityCancellationType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :TRY_CANCEL | :WAIT_CANCELLATION_COMPLETED | :ABANDON

  field :TRY_CANCEL, 0
  field :WAIT_CANCELLATION_COMPLETED, 1
  field :ABANDON, 2
end
defmodule Temporal.Coresdk.WorkflowCommands.WorkflowCommand do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          variant:
            {:start_timer, Temporal.Coresdk.WorkflowCommands.StartTimer.t() | nil}
            | {:schedule_activity, Temporal.Coresdk.WorkflowCommands.ScheduleActivity.t() | nil}
            | {:respond_to_query, Temporal.Coresdk.WorkflowCommands.QueryResult.t() | nil}
            | {:request_cancel_activity,
               Temporal.Coresdk.WorkflowCommands.RequestCancelActivity.t() | nil}
            | {:cancel_timer, Temporal.Coresdk.WorkflowCommands.CancelTimer.t() | nil}
            | {:complete_workflow_execution,
               Temporal.Coresdk.WorkflowCommands.CompleteWorkflowExecution.t() | nil}
            | {:fail_workflow_execution,
               Temporal.Coresdk.WorkflowCommands.FailWorkflowExecution.t() | nil}
            | {:continue_as_new_workflow_execution,
               Temporal.Coresdk.WorkflowCommands.ContinueAsNewWorkflowExecution.t() | nil}
            | {:cancel_workflow_execution,
               Temporal.Coresdk.WorkflowCommands.CancelWorkflowExecution.t() | nil}
            | {:set_patch_marker, Temporal.Coresdk.WorkflowCommands.SetPatchMarker.t() | nil}
            | {:start_child_workflow_execution,
               Temporal.Coresdk.WorkflowCommands.StartChildWorkflowExecution.t() | nil}
            | {:cancel_unstarted_child_workflow_execution,
               Temporal.Coresdk.WorkflowCommands.CancelUnstartedChildWorkflowExecution.t() | nil}
            | {:request_cancel_external_workflow_execution,
               Temporal.Coresdk.WorkflowCommands.RequestCancelExternalWorkflowExecution.t() | nil}
            | {:signal_external_workflow_execution,
               Temporal.Coresdk.WorkflowCommands.SignalExternalWorkflowExecution.t() | nil}
            | {:cancel_signal_workflow,
               Temporal.Coresdk.WorkflowCommands.CancelSignalWorkflow.t() | nil}
            | {:schedule_local_activity,
               Temporal.Coresdk.WorkflowCommands.ScheduleLocalActivity.t() | nil}
            | {:request_cancel_local_activity,
               Temporal.Coresdk.WorkflowCommands.RequestCancelLocalActivity.t() | nil}
        }

  defstruct variant: nil

  oneof :variant, 0

  field :start_timer, 1,
    type: Temporal.Coresdk.WorkflowCommands.StartTimer,
    json_name: "startTimer",
    oneof: 0

  field :schedule_activity, 2,
    type: Temporal.Coresdk.WorkflowCommands.ScheduleActivity,
    json_name: "scheduleActivity",
    oneof: 0

  field :respond_to_query, 3,
    type: Temporal.Coresdk.WorkflowCommands.QueryResult,
    json_name: "respondToQuery",
    oneof: 0

  field :request_cancel_activity, 4,
    type: Temporal.Coresdk.WorkflowCommands.RequestCancelActivity,
    json_name: "requestCancelActivity",
    oneof: 0

  field :cancel_timer, 5,
    type: Temporal.Coresdk.WorkflowCommands.CancelTimer,
    json_name: "cancelTimer",
    oneof: 0

  field :complete_workflow_execution, 6,
    type: Temporal.Coresdk.WorkflowCommands.CompleteWorkflowExecution,
    json_name: "completeWorkflowExecution",
    oneof: 0

  field :fail_workflow_execution, 7,
    type: Temporal.Coresdk.WorkflowCommands.FailWorkflowExecution,
    json_name: "failWorkflowExecution",
    oneof: 0

  field :continue_as_new_workflow_execution, 8,
    type: Temporal.Coresdk.WorkflowCommands.ContinueAsNewWorkflowExecution,
    json_name: "continueAsNewWorkflowExecution",
    oneof: 0

  field :cancel_workflow_execution, 9,
    type: Temporal.Coresdk.WorkflowCommands.CancelWorkflowExecution,
    json_name: "cancelWorkflowExecution",
    oneof: 0

  field :set_patch_marker, 10,
    type: Temporal.Coresdk.WorkflowCommands.SetPatchMarker,
    json_name: "setPatchMarker",
    oneof: 0

  field :start_child_workflow_execution, 11,
    type: Temporal.Coresdk.WorkflowCommands.StartChildWorkflowExecution,
    json_name: "startChildWorkflowExecution",
    oneof: 0

  field :cancel_unstarted_child_workflow_execution, 12,
    type: Temporal.Coresdk.WorkflowCommands.CancelUnstartedChildWorkflowExecution,
    json_name: "cancelUnstartedChildWorkflowExecution",
    oneof: 0

  field :request_cancel_external_workflow_execution, 13,
    type: Temporal.Coresdk.WorkflowCommands.RequestCancelExternalWorkflowExecution,
    json_name: "requestCancelExternalWorkflowExecution",
    oneof: 0

  field :signal_external_workflow_execution, 14,
    type: Temporal.Coresdk.WorkflowCommands.SignalExternalWorkflowExecution,
    json_name: "signalExternalWorkflowExecution",
    oneof: 0

  field :cancel_signal_workflow, 15,
    type: Temporal.Coresdk.WorkflowCommands.CancelSignalWorkflow,
    json_name: "cancelSignalWorkflow",
    oneof: 0

  field :schedule_local_activity, 16,
    type: Temporal.Coresdk.WorkflowCommands.ScheduleLocalActivity,
    json_name: "scheduleLocalActivity",
    oneof: 0

  field :request_cancel_local_activity, 17,
    type: Temporal.Coresdk.WorkflowCommands.RequestCancelLocalActivity,
    json_name: "requestCancelLocalActivity",
    oneof: 0
end
defmodule Temporal.Coresdk.WorkflowCommands.StartTimer do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          seq: non_neg_integer,
          start_to_fire_timeout: Temporal.Google.Protobuf.Duration.t() | nil
        }

  defstruct seq: 0,
            start_to_fire_timeout: nil

  field :seq, 1, type: :uint32

  field :start_to_fire_timeout, 2,
    type: Temporal.Google.Protobuf.Duration,
    json_name: "startToFireTimeout"
end
defmodule Temporal.Coresdk.WorkflowCommands.CancelTimer do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          seq: non_neg_integer
        }

  defstruct seq: 0

  field :seq, 1, type: :uint32
end
defmodule Temporal.Coresdk.WorkflowCommands.ScheduleActivity.HeaderFieldsEntry do
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
defmodule Temporal.Coresdk.WorkflowCommands.ScheduleActivity do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          seq: non_neg_integer,
          activity_id: String.t(),
          activity_type: String.t(),
          namespace: String.t(),
          task_queue: String.t(),
          header_fields: %{String.t() => Temporal.Coresdk.Common.Payload.t() | nil},
          arguments: [Temporal.Coresdk.Common.Payload.t()],
          schedule_to_close_timeout: Temporal.Google.Protobuf.Duration.t() | nil,
          schedule_to_start_timeout: Temporal.Google.Protobuf.Duration.t() | nil,
          start_to_close_timeout: Temporal.Google.Protobuf.Duration.t() | nil,
          heartbeat_timeout: Temporal.Google.Protobuf.Duration.t() | nil,
          retry_policy: Temporal.Coresdk.Common.RetryPolicy.t() | nil,
          cancellation_type: Temporal.Coresdk.WorkflowCommands.ActivityCancellationType.t()
        }

  defstruct seq: 0,
            activity_id: "",
            activity_type: "",
            namespace: "",
            task_queue: "",
            header_fields: %{},
            arguments: [],
            schedule_to_close_timeout: nil,
            schedule_to_start_timeout: nil,
            start_to_close_timeout: nil,
            heartbeat_timeout: nil,
            retry_policy: nil,
            cancellation_type: :TRY_CANCEL

  field :seq, 1, type: :uint32
  field :activity_id, 2, type: :string, json_name: "activityId"
  field :activity_type, 3, type: :string, json_name: "activityType"
  field :namespace, 4, type: :string
  field :task_queue, 5, type: :string, json_name: "taskQueue"

  field :header_fields, 6,
    repeated: true,
    type: Temporal.Coresdk.WorkflowCommands.ScheduleActivity.HeaderFieldsEntry,
    json_name: "headerFields",
    map: true

  field :arguments, 7, repeated: true, type: Temporal.Coresdk.Common.Payload

  field :schedule_to_close_timeout, 8,
    type: Temporal.Google.Protobuf.Duration,
    json_name: "scheduleToCloseTimeout"

  field :schedule_to_start_timeout, 9,
    type: Temporal.Google.Protobuf.Duration,
    json_name: "scheduleToStartTimeout"

  field :start_to_close_timeout, 10,
    type: Temporal.Google.Protobuf.Duration,
    json_name: "startToCloseTimeout"

  field :heartbeat_timeout, 11,
    type: Temporal.Google.Protobuf.Duration,
    json_name: "heartbeatTimeout"

  field :retry_policy, 12, type: Temporal.Coresdk.Common.RetryPolicy, json_name: "retryPolicy"

  field :cancellation_type, 13,
    type: Temporal.Coresdk.WorkflowCommands.ActivityCancellationType,
    json_name: "cancellationType",
    enum: true
end
defmodule Temporal.Coresdk.WorkflowCommands.ScheduleLocalActivity.HeaderFieldsEntry do
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
defmodule Temporal.Coresdk.WorkflowCommands.ScheduleLocalActivity do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          seq: non_neg_integer,
          activity_id: String.t(),
          activity_type: String.t(),
          attempt: non_neg_integer,
          original_schedule_time: Temporal.Google.Protobuf.Timestamp.t() | nil,
          header_fields: %{String.t() => Temporal.Coresdk.Common.Payload.t() | nil},
          arguments: [Temporal.Coresdk.Common.Payload.t()],
          schedule_to_close_timeout: Temporal.Google.Protobuf.Duration.t() | nil,
          schedule_to_start_timeout: Temporal.Google.Protobuf.Duration.t() | nil,
          start_to_close_timeout: Temporal.Google.Protobuf.Duration.t() | nil,
          retry_policy: Temporal.Coresdk.Common.RetryPolicy.t() | nil,
          local_retry_threshold: Temporal.Google.Protobuf.Duration.t() | nil,
          cancellation_type: Temporal.Coresdk.WorkflowCommands.ActivityCancellationType.t()
        }

  defstruct seq: 0,
            activity_id: "",
            activity_type: "",
            attempt: 0,
            original_schedule_time: nil,
            header_fields: %{},
            arguments: [],
            schedule_to_close_timeout: nil,
            schedule_to_start_timeout: nil,
            start_to_close_timeout: nil,
            retry_policy: nil,
            local_retry_threshold: nil,
            cancellation_type: :TRY_CANCEL

  field :seq, 1, type: :uint32
  field :activity_id, 2, type: :string, json_name: "activityId"
  field :activity_type, 3, type: :string, json_name: "activityType"
  field :attempt, 4, type: :uint32

  field :original_schedule_time, 5,
    type: Temporal.Google.Protobuf.Timestamp,
    json_name: "originalScheduleTime"

  field :header_fields, 6,
    repeated: true,
    type: Temporal.Coresdk.WorkflowCommands.ScheduleLocalActivity.HeaderFieldsEntry,
    json_name: "headerFields",
    map: true

  field :arguments, 7, repeated: true, type: Temporal.Coresdk.Common.Payload

  field :schedule_to_close_timeout, 8,
    type: Temporal.Google.Protobuf.Duration,
    json_name: "scheduleToCloseTimeout"

  field :schedule_to_start_timeout, 9,
    type: Temporal.Google.Protobuf.Duration,
    json_name: "scheduleToStartTimeout"

  field :start_to_close_timeout, 10,
    type: Temporal.Google.Protobuf.Duration,
    json_name: "startToCloseTimeout"

  field :retry_policy, 11, type: Temporal.Coresdk.Common.RetryPolicy, json_name: "retryPolicy"

  field :local_retry_threshold, 12,
    type: Temporal.Google.Protobuf.Duration,
    json_name: "localRetryThreshold"

  field :cancellation_type, 13,
    type: Temporal.Coresdk.WorkflowCommands.ActivityCancellationType,
    json_name: "cancellationType",
    enum: true
end
defmodule Temporal.Coresdk.WorkflowCommands.RequestCancelActivity do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          seq: non_neg_integer
        }

  defstruct seq: 0

  field :seq, 1, type: :uint32
end
defmodule Temporal.Coresdk.WorkflowCommands.RequestCancelLocalActivity do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          seq: non_neg_integer
        }

  defstruct seq: 0

  field :seq, 1, type: :uint32
end
defmodule Temporal.Coresdk.WorkflowCommands.QueryResult do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          variant:
            {:succeeded, Temporal.Coresdk.WorkflowCommands.QuerySuccess.t() | nil}
            | {:failed, Temporal.Temporal.Api.Failure.V1.Failure.t() | nil},
          query_id: String.t()
        }

  defstruct variant: nil,
            query_id: ""

  oneof :variant, 0

  field :query_id, 1, type: :string, json_name: "queryId"
  field :succeeded, 2, type: Temporal.Coresdk.WorkflowCommands.QuerySuccess, oneof: 0
  field :failed, 3, type: Temporal.Temporal.Api.Failure.V1.Failure, oneof: 0
end
defmodule Temporal.Coresdk.WorkflowCommands.QuerySuccess do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          response: Temporal.Coresdk.Common.Payload.t() | nil
        }

  defstruct response: nil

  field :response, 1, type: Temporal.Coresdk.Common.Payload
end
defmodule Temporal.Coresdk.WorkflowCommands.CompleteWorkflowExecution do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          result: Temporal.Coresdk.Common.Payload.t() | nil
        }

  defstruct result: nil

  field :result, 1, type: Temporal.Coresdk.Common.Payload
end
defmodule Temporal.Coresdk.WorkflowCommands.FailWorkflowExecution do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          failure: Temporal.Temporal.Api.Failure.V1.Failure.t() | nil
        }

  defstruct failure: nil

  field :failure, 1, type: Temporal.Temporal.Api.Failure.V1.Failure
end
defmodule Temporal.Coresdk.WorkflowCommands.ContinueAsNewWorkflowExecution.MemoEntry do
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
defmodule Temporal.Coresdk.WorkflowCommands.ContinueAsNewWorkflowExecution.HeaderEntry do
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
defmodule Temporal.Coresdk.WorkflowCommands.ContinueAsNewWorkflowExecution.SearchAttributesEntry do
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
defmodule Temporal.Coresdk.WorkflowCommands.ContinueAsNewWorkflowExecution do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          workflow_type: String.t(),
          task_queue: String.t(),
          arguments: [Temporal.Coresdk.Common.Payload.t()],
          workflow_run_timeout: Temporal.Google.Protobuf.Duration.t() | nil,
          workflow_task_timeout: Temporal.Google.Protobuf.Duration.t() | nil,
          memo: %{String.t() => Temporal.Coresdk.Common.Payload.t() | nil},
          header: %{String.t() => Temporal.Coresdk.Common.Payload.t() | nil},
          search_attributes: %{String.t() => Temporal.Coresdk.Common.Payload.t() | nil}
        }

  defstruct workflow_type: "",
            task_queue: "",
            arguments: [],
            workflow_run_timeout: nil,
            workflow_task_timeout: nil,
            memo: %{},
            header: %{},
            search_attributes: %{}

  field :workflow_type, 1, type: :string, json_name: "workflowType"
  field :task_queue, 2, type: :string, json_name: "taskQueue"
  field :arguments, 3, repeated: true, type: Temporal.Coresdk.Common.Payload

  field :workflow_run_timeout, 4,
    type: Temporal.Google.Protobuf.Duration,
    json_name: "workflowRunTimeout"

  field :workflow_task_timeout, 5,
    type: Temporal.Google.Protobuf.Duration,
    json_name: "workflowTaskTimeout"

  field :memo, 6,
    repeated: true,
    type: Temporal.Coresdk.WorkflowCommands.ContinueAsNewWorkflowExecution.MemoEntry,
    map: true

  field :header, 7,
    repeated: true,
    type: Temporal.Coresdk.WorkflowCommands.ContinueAsNewWorkflowExecution.HeaderEntry,
    map: true

  field :search_attributes, 8,
    repeated: true,
    type: Temporal.Coresdk.WorkflowCommands.ContinueAsNewWorkflowExecution.SearchAttributesEntry,
    json_name: "searchAttributes",
    map: true
end
defmodule Temporal.Coresdk.WorkflowCommands.CancelWorkflowExecution do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}

  defstruct []
end
defmodule Temporal.Coresdk.WorkflowCommands.SetPatchMarker do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          patch_id: String.t(),
          deprecated: boolean
        }

  defstruct patch_id: "",
            deprecated: false

  field :patch_id, 1, type: :string, json_name: "patchId"
  field :deprecated, 2, type: :bool
end
defmodule Temporal.Coresdk.WorkflowCommands.StartChildWorkflowExecution.HeaderEntry do
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
defmodule Temporal.Coresdk.WorkflowCommands.StartChildWorkflowExecution.MemoEntry do
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
defmodule Temporal.Coresdk.WorkflowCommands.StartChildWorkflowExecution.SearchAttributesEntry do
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
defmodule Temporal.Coresdk.WorkflowCommands.StartChildWorkflowExecution do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          seq: non_neg_integer,
          namespace: String.t(),
          workflow_id: String.t(),
          workflow_type: String.t(),
          task_queue: String.t(),
          input: [Temporal.Coresdk.Common.Payload.t()],
          workflow_execution_timeout: Temporal.Google.Protobuf.Duration.t() | nil,
          workflow_run_timeout: Temporal.Google.Protobuf.Duration.t() | nil,
          workflow_task_timeout: Temporal.Google.Protobuf.Duration.t() | nil,
          parent_close_policy: Temporal.Coresdk.ChildWorkflow.ParentClosePolicy.t(),
          workflow_id_reuse_policy: Temporal.Coresdk.Common.WorkflowIdReusePolicy.t(),
          retry_policy: Temporal.Coresdk.Common.RetryPolicy.t() | nil,
          cron_schedule: String.t(),
          header: %{String.t() => Temporal.Coresdk.Common.Payload.t() | nil},
          memo: %{String.t() => Temporal.Coresdk.Common.Payload.t() | nil},
          search_attributes: %{String.t() => Temporal.Coresdk.Common.Payload.t() | nil},
          cancellation_type: Temporal.Coresdk.ChildWorkflow.ChildWorkflowCancellationType.t()
        }

  defstruct seq: 0,
            namespace: "",
            workflow_id: "",
            workflow_type: "",
            task_queue: "",
            input: [],
            workflow_execution_timeout: nil,
            workflow_run_timeout: nil,
            workflow_task_timeout: nil,
            parent_close_policy: :PARENT_CLOSE_POLICY_UNSPECIFIED,
            workflow_id_reuse_policy: :WORKFLOW_ID_REUSE_POLICY_UNSPECIFIED,
            retry_policy: nil,
            cron_schedule: "",
            header: %{},
            memo: %{},
            search_attributes: %{},
            cancellation_type: :ABANDON

  field :seq, 1, type: :uint32
  field :namespace, 2, type: :string
  field :workflow_id, 3, type: :string, json_name: "workflowId"
  field :workflow_type, 4, type: :string, json_name: "workflowType"
  field :task_queue, 5, type: :string, json_name: "taskQueue"
  field :input, 6, repeated: true, type: Temporal.Coresdk.Common.Payload

  field :workflow_execution_timeout, 7,
    type: Temporal.Google.Protobuf.Duration,
    json_name: "workflowExecutionTimeout"

  field :workflow_run_timeout, 8,
    type: Temporal.Google.Protobuf.Duration,
    json_name: "workflowRunTimeout"

  field :workflow_task_timeout, 9,
    type: Temporal.Google.Protobuf.Duration,
    json_name: "workflowTaskTimeout"

  field :parent_close_policy, 10,
    type: Temporal.Coresdk.ChildWorkflow.ParentClosePolicy,
    json_name: "parentClosePolicy",
    enum: true

  field :workflow_id_reuse_policy, 12,
    type: Temporal.Coresdk.Common.WorkflowIdReusePolicy,
    json_name: "workflowIdReusePolicy",
    enum: true

  field :retry_policy, 13, type: Temporal.Coresdk.Common.RetryPolicy, json_name: "retryPolicy"
  field :cron_schedule, 14, type: :string, json_name: "cronSchedule"

  field :header, 15,
    repeated: true,
    type: Temporal.Coresdk.WorkflowCommands.StartChildWorkflowExecution.HeaderEntry,
    map: true

  field :memo, 16,
    repeated: true,
    type: Temporal.Coresdk.WorkflowCommands.StartChildWorkflowExecution.MemoEntry,
    map: true

  field :search_attributes, 17,
    repeated: true,
    type: Temporal.Coresdk.WorkflowCommands.StartChildWorkflowExecution.SearchAttributesEntry,
    json_name: "searchAttributes",
    map: true

  field :cancellation_type, 18,
    type: Temporal.Coresdk.ChildWorkflow.ChildWorkflowCancellationType,
    json_name: "cancellationType",
    enum: true
end
defmodule Temporal.Coresdk.WorkflowCommands.CancelUnstartedChildWorkflowExecution do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          child_workflow_seq: non_neg_integer
        }

  defstruct child_workflow_seq: 0

  field :child_workflow_seq, 1, type: :uint32, json_name: "childWorkflowSeq"
end
defmodule Temporal.Coresdk.WorkflowCommands.RequestCancelExternalWorkflowExecution do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          target:
            {:workflow_execution, Temporal.Coresdk.Common.NamespacedWorkflowExecution.t() | nil}
            | {:child_workflow_id, String.t()},
          seq: non_neg_integer
        }

  defstruct target: nil,
            seq: 0

  oneof :target, 0

  field :seq, 1, type: :uint32

  field :workflow_execution, 2,
    type: Temporal.Coresdk.Common.NamespacedWorkflowExecution,
    json_name: "workflowExecution",
    oneof: 0

  field :child_workflow_id, 3, type: :string, json_name: "childWorkflowId", oneof: 0
end
defmodule Temporal.Coresdk.WorkflowCommands.SignalExternalWorkflowExecution do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          target:
            {:workflow_execution, Temporal.Coresdk.Common.NamespacedWorkflowExecution.t() | nil}
            | {:child_workflow_id, String.t()},
          seq: non_neg_integer,
          signal_name: String.t(),
          args: [Temporal.Coresdk.Common.Payload.t()]
        }

  defstruct target: nil,
            seq: 0,
            signal_name: "",
            args: []

  oneof :target, 0

  field :seq, 1, type: :uint32

  field :workflow_execution, 2,
    type: Temporal.Coresdk.Common.NamespacedWorkflowExecution,
    json_name: "workflowExecution",
    oneof: 0

  field :child_workflow_id, 3, type: :string, json_name: "childWorkflowId", oneof: 0
  field :signal_name, 4, type: :string, json_name: "signalName"
  field :args, 5, repeated: true, type: Temporal.Coresdk.Common.Payload
end
defmodule Temporal.Coresdk.WorkflowCommands.CancelSignalWorkflow do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          seq: non_neg_integer
        }

  defstruct seq: 0

  field :seq, 1, type: :uint32
end

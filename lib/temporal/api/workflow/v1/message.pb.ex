defmodule Temporal.Api.Workflow.V1.WorkflowExecutionInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          execution: Temporal.Api.Common.V1.WorkflowExecution.t() | nil,
          type: Temporal.Api.Common.V1.WorkflowType.t() | nil,
          start_time: Google.Protobuf.Timestamp.t() | nil,
          close_time: Google.Protobuf.Timestamp.t() | nil,
          status: Temporal.Api.Enums.V1.WorkflowExecutionStatus.t(),
          history_length: integer,
          parent_namespace_id: String.t(),
          parent_execution: Temporal.Api.Common.V1.WorkflowExecution.t() | nil,
          execution_time: Google.Protobuf.Timestamp.t() | nil,
          memo: Temporal.Api.Common.V1.Memo.t() | nil,
          search_attributes: Temporal.Api.Common.V1.SearchAttributes.t() | nil,
          auto_reset_points: Temporal.Api.Workflow.V1.ResetPoints.t() | nil,
          task_queue: String.t(),
          state_transition_count: integer
        }

  defstruct execution: nil,
            type: nil,
            start_time: nil,
            close_time: nil,
            status: :WORKFLOW_EXECUTION_STATUS_UNSPECIFIED,
            history_length: 0,
            parent_namespace_id: "",
            parent_execution: nil,
            execution_time: nil,
            memo: nil,
            search_attributes: nil,
            auto_reset_points: nil,
            task_queue: "",
            state_transition_count: 0

  field :execution, 1, type: Temporal.Api.Common.V1.WorkflowExecution
  field :type, 2, type: Temporal.Api.Common.V1.WorkflowType
  field :start_time, 3, type: Google.Protobuf.Timestamp, json_name: "startTime", deprecated: false
  field :close_time, 4, type: Google.Protobuf.Timestamp, json_name: "closeTime", deprecated: false
  field :status, 5, type: Temporal.Api.Enums.V1.WorkflowExecutionStatus, enum: true
  field :history_length, 6, type: :int64, json_name: "historyLength"
  field :parent_namespace_id, 7, type: :string, json_name: "parentNamespaceId"

  field :parent_execution, 8,
    type: Temporal.Api.Common.V1.WorkflowExecution,
    json_name: "parentExecution"

  field :execution_time, 9,
    type: Google.Protobuf.Timestamp,
    json_name: "executionTime",
    deprecated: false

  field :memo, 10, type: Temporal.Api.Common.V1.Memo

  field :search_attributes, 11,
    type: Temporal.Api.Common.V1.SearchAttributes,
    json_name: "searchAttributes"

  field :auto_reset_points, 12,
    type: Temporal.Api.Workflow.V1.ResetPoints,
    json_name: "autoResetPoints"

  field :task_queue, 13, type: :string, json_name: "taskQueue"
  field :state_transition_count, 14, type: :int64, json_name: "stateTransitionCount"
end
defmodule Temporal.Api.Workflow.V1.WorkflowExecutionConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          task_queue: Temporal.Api.Taskqueue.V1.TaskQueue.t() | nil,
          workflow_execution_timeout: Google.Protobuf.Duration.t() | nil,
          workflow_run_timeout: Google.Protobuf.Duration.t() | nil,
          default_workflow_task_timeout: Google.Protobuf.Duration.t() | nil
        }

  defstruct task_queue: nil,
            workflow_execution_timeout: nil,
            workflow_run_timeout: nil,
            default_workflow_task_timeout: nil

  field :task_queue, 1, type: Temporal.Api.Taskqueue.V1.TaskQueue, json_name: "taskQueue"

  field :workflow_execution_timeout, 2,
    type: Google.Protobuf.Duration,
    json_name: "workflowExecutionTimeout",
    deprecated: false

  field :workflow_run_timeout, 3,
    type: Google.Protobuf.Duration,
    json_name: "workflowRunTimeout",
    deprecated: false

  field :default_workflow_task_timeout, 4,
    type: Google.Protobuf.Duration,
    json_name: "defaultWorkflowTaskTimeout",
    deprecated: false
end
defmodule Temporal.Api.Workflow.V1.PendingActivityInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          activity_id: String.t(),
          activity_type: Temporal.Api.Common.V1.ActivityType.t() | nil,
          state: Temporal.Api.Enums.V1.PendingActivityState.t(),
          heartbeat_details: Temporal.Api.Common.V1.Payloads.t() | nil,
          last_heartbeat_time: Google.Protobuf.Timestamp.t() | nil,
          last_started_time: Google.Protobuf.Timestamp.t() | nil,
          attempt: integer,
          maximum_attempts: integer,
          scheduled_time: Google.Protobuf.Timestamp.t() | nil,
          expiration_time: Google.Protobuf.Timestamp.t() | nil,
          last_failure: Temporal.Api.Failure.V1.Failure.t() | nil,
          last_worker_identity: String.t()
        }

  defstruct activity_id: "",
            activity_type: nil,
            state: :PENDING_ACTIVITY_STATE_UNSPECIFIED,
            heartbeat_details: nil,
            last_heartbeat_time: nil,
            last_started_time: nil,
            attempt: 0,
            maximum_attempts: 0,
            scheduled_time: nil,
            expiration_time: nil,
            last_failure: nil,
            last_worker_identity: ""

  field :activity_id, 1, type: :string, json_name: "activityId"
  field :activity_type, 2, type: Temporal.Api.Common.V1.ActivityType, json_name: "activityType"
  field :state, 3, type: Temporal.Api.Enums.V1.PendingActivityState, enum: true

  field :heartbeat_details, 4,
    type: Temporal.Api.Common.V1.Payloads,
    json_name: "heartbeatDetails"

  field :last_heartbeat_time, 5,
    type: Google.Protobuf.Timestamp,
    json_name: "lastHeartbeatTime",
    deprecated: false

  field :last_started_time, 6,
    type: Google.Protobuf.Timestamp,
    json_name: "lastStartedTime",
    deprecated: false

  field :attempt, 7, type: :int32
  field :maximum_attempts, 8, type: :int32, json_name: "maximumAttempts"

  field :scheduled_time, 9,
    type: Google.Protobuf.Timestamp,
    json_name: "scheduledTime",
    deprecated: false

  field :expiration_time, 10,
    type: Google.Protobuf.Timestamp,
    json_name: "expirationTime",
    deprecated: false

  field :last_failure, 11, type: Temporal.Api.Failure.V1.Failure, json_name: "lastFailure"
  field :last_worker_identity, 12, type: :string, json_name: "lastWorkerIdentity"
end
defmodule Temporal.Api.Workflow.V1.PendingChildExecutionInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          workflow_id: String.t(),
          run_id: String.t(),
          workflow_type_name: String.t(),
          initiated_id: integer,
          parent_close_policy: Temporal.Api.Enums.V1.ParentClosePolicy.t()
        }

  defstruct workflow_id: "",
            run_id: "",
            workflow_type_name: "",
            initiated_id: 0,
            parent_close_policy: :PARENT_CLOSE_POLICY_UNSPECIFIED

  field :workflow_id, 1, type: :string, json_name: "workflowId"
  field :run_id, 2, type: :string, json_name: "runId"
  field :workflow_type_name, 3, type: :string, json_name: "workflowTypeName"
  field :initiated_id, 4, type: :int64, json_name: "initiatedId"

  field :parent_close_policy, 5,
    type: Temporal.Api.Enums.V1.ParentClosePolicy,
    json_name: "parentClosePolicy",
    enum: true
end
defmodule Temporal.Api.Workflow.V1.ResetPoints do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          points: [Temporal.Api.Workflow.V1.ResetPointInfo.t()]
        }

  defstruct points: []

  field :points, 1, repeated: true, type: Temporal.Api.Workflow.V1.ResetPointInfo
end
defmodule Temporal.Api.Workflow.V1.ResetPointInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          binary_checksum: String.t(),
          run_id: String.t(),
          first_workflow_task_completed_id: integer,
          create_time: Google.Protobuf.Timestamp.t() | nil,
          expire_time: Google.Protobuf.Timestamp.t() | nil,
          resettable: boolean
        }

  defstruct binary_checksum: "",
            run_id: "",
            first_workflow_task_completed_id: 0,
            create_time: nil,
            expire_time: nil,
            resettable: false

  field :binary_checksum, 1, type: :string, json_name: "binaryChecksum"
  field :run_id, 2, type: :string, json_name: "runId"

  field :first_workflow_task_completed_id, 3,
    type: :int64,
    json_name: "firstWorkflowTaskCompletedId"

  field :create_time, 4,
    type: Google.Protobuf.Timestamp,
    json_name: "createTime",
    deprecated: false

  field :expire_time, 5,
    type: Google.Protobuf.Timestamp,
    json_name: "expireTime",
    deprecated: false

  field :resettable, 6, type: :bool
end

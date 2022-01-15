defmodule Temporal.Api.Enums.V1.WorkflowIdReusePolicy do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t ::
          integer
          | :WORKFLOW_ID_REUSE_POLICY_UNSPECIFIED
          | :WORKFLOW_ID_REUSE_POLICY_ALLOW_DUPLICATE
          | :WORKFLOW_ID_REUSE_POLICY_ALLOW_DUPLICATE_FAILED_ONLY
          | :WORKFLOW_ID_REUSE_POLICY_REJECT_DUPLICATE

  field :WORKFLOW_ID_REUSE_POLICY_UNSPECIFIED, 0
  field :WORKFLOW_ID_REUSE_POLICY_ALLOW_DUPLICATE, 1
  field :WORKFLOW_ID_REUSE_POLICY_ALLOW_DUPLICATE_FAILED_ONLY, 2
  field :WORKFLOW_ID_REUSE_POLICY_REJECT_DUPLICATE, 3
end
defmodule Temporal.Api.Enums.V1.ParentClosePolicy do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t ::
          integer
          | :PARENT_CLOSE_POLICY_UNSPECIFIED
          | :PARENT_CLOSE_POLICY_TERMINATE
          | :PARENT_CLOSE_POLICY_ABANDON
          | :PARENT_CLOSE_POLICY_REQUEST_CANCEL

  field :PARENT_CLOSE_POLICY_UNSPECIFIED, 0
  field :PARENT_CLOSE_POLICY_TERMINATE, 1
  field :PARENT_CLOSE_POLICY_ABANDON, 2
  field :PARENT_CLOSE_POLICY_REQUEST_CANCEL, 3
end
defmodule Temporal.Api.Enums.V1.ContinueAsNewInitiator do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t ::
          integer
          | :CONTINUE_AS_NEW_INITIATOR_UNSPECIFIED
          | :CONTINUE_AS_NEW_INITIATOR_WORKFLOW
          | :CONTINUE_AS_NEW_INITIATOR_RETRY
          | :CONTINUE_AS_NEW_INITIATOR_CRON_SCHEDULE

  field :CONTINUE_AS_NEW_INITIATOR_UNSPECIFIED, 0
  field :CONTINUE_AS_NEW_INITIATOR_WORKFLOW, 1
  field :CONTINUE_AS_NEW_INITIATOR_RETRY, 2
  field :CONTINUE_AS_NEW_INITIATOR_CRON_SCHEDULE, 3
end
defmodule Temporal.Api.Enums.V1.WorkflowExecutionStatus do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t ::
          integer
          | :WORKFLOW_EXECUTION_STATUS_UNSPECIFIED
          | :WORKFLOW_EXECUTION_STATUS_RUNNING
          | :WORKFLOW_EXECUTION_STATUS_COMPLETED
          | :WORKFLOW_EXECUTION_STATUS_FAILED
          | :WORKFLOW_EXECUTION_STATUS_CANCELED
          | :WORKFLOW_EXECUTION_STATUS_TERMINATED
          | :WORKFLOW_EXECUTION_STATUS_CONTINUED_AS_NEW
          | :WORKFLOW_EXECUTION_STATUS_TIMED_OUT

  field :WORKFLOW_EXECUTION_STATUS_UNSPECIFIED, 0
  field :WORKFLOW_EXECUTION_STATUS_RUNNING, 1
  field :WORKFLOW_EXECUTION_STATUS_COMPLETED, 2
  field :WORKFLOW_EXECUTION_STATUS_FAILED, 3
  field :WORKFLOW_EXECUTION_STATUS_CANCELED, 4
  field :WORKFLOW_EXECUTION_STATUS_TERMINATED, 5
  field :WORKFLOW_EXECUTION_STATUS_CONTINUED_AS_NEW, 6
  field :WORKFLOW_EXECUTION_STATUS_TIMED_OUT, 7
end
defmodule Temporal.Api.Enums.V1.PendingActivityState do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t ::
          integer
          | :PENDING_ACTIVITY_STATE_UNSPECIFIED
          | :PENDING_ACTIVITY_STATE_SCHEDULED
          | :PENDING_ACTIVITY_STATE_STARTED
          | :PENDING_ACTIVITY_STATE_CANCEL_REQUESTED

  field :PENDING_ACTIVITY_STATE_UNSPECIFIED, 0
  field :PENDING_ACTIVITY_STATE_SCHEDULED, 1
  field :PENDING_ACTIVITY_STATE_STARTED, 2
  field :PENDING_ACTIVITY_STATE_CANCEL_REQUESTED, 3
end
defmodule Temporal.Api.Enums.V1.HistoryEventFilterType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t ::
          integer
          | :HISTORY_EVENT_FILTER_TYPE_UNSPECIFIED
          | :HISTORY_EVENT_FILTER_TYPE_ALL_EVENT
          | :HISTORY_EVENT_FILTER_TYPE_CLOSE_EVENT

  field :HISTORY_EVENT_FILTER_TYPE_UNSPECIFIED, 0
  field :HISTORY_EVENT_FILTER_TYPE_ALL_EVENT, 1
  field :HISTORY_EVENT_FILTER_TYPE_CLOSE_EVENT, 2
end
defmodule Temporal.Api.Enums.V1.RetryState do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t ::
          integer
          | :RETRY_STATE_UNSPECIFIED
          | :RETRY_STATE_IN_PROGRESS
          | :RETRY_STATE_NON_RETRYABLE_FAILURE
          | :RETRY_STATE_TIMEOUT
          | :RETRY_STATE_MAXIMUM_ATTEMPTS_REACHED
          | :RETRY_STATE_RETRY_POLICY_NOT_SET
          | :RETRY_STATE_INTERNAL_SERVER_ERROR
          | :RETRY_STATE_CANCEL_REQUESTED

  field :RETRY_STATE_UNSPECIFIED, 0
  field :RETRY_STATE_IN_PROGRESS, 1
  field :RETRY_STATE_NON_RETRYABLE_FAILURE, 2
  field :RETRY_STATE_TIMEOUT, 3
  field :RETRY_STATE_MAXIMUM_ATTEMPTS_REACHED, 4
  field :RETRY_STATE_RETRY_POLICY_NOT_SET, 5
  field :RETRY_STATE_INTERNAL_SERVER_ERROR, 6
  field :RETRY_STATE_CANCEL_REQUESTED, 7
end
defmodule Temporal.Api.Enums.V1.TimeoutType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t ::
          integer
          | :TIMEOUT_TYPE_UNSPECIFIED
          | :TIMEOUT_TYPE_START_TO_CLOSE
          | :TIMEOUT_TYPE_SCHEDULE_TO_START
          | :TIMEOUT_TYPE_SCHEDULE_TO_CLOSE
          | :TIMEOUT_TYPE_HEARTBEAT

  field :TIMEOUT_TYPE_UNSPECIFIED, 0
  field :TIMEOUT_TYPE_START_TO_CLOSE, 1
  field :TIMEOUT_TYPE_SCHEDULE_TO_START, 2
  field :TIMEOUT_TYPE_SCHEDULE_TO_CLOSE, 3
  field :TIMEOUT_TYPE_HEARTBEAT, 4
end

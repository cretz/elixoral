defmodule Temporal.Coresdk.ChildWorkflow.ParentClosePolicy do
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
defmodule Temporal.Coresdk.ChildWorkflow.StartChildWorkflowExecutionFailedCause do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t ::
          integer
          | :START_CHILD_WORKFLOW_EXECUTION_FAILED_CAUSE_UNSPECIFIED
          | :START_CHILD_WORKFLOW_EXECUTION_FAILED_CAUSE_WORKFLOW_ALREADY_EXISTS

  field :START_CHILD_WORKFLOW_EXECUTION_FAILED_CAUSE_UNSPECIFIED, 0
  field :START_CHILD_WORKFLOW_EXECUTION_FAILED_CAUSE_WORKFLOW_ALREADY_EXISTS, 1
end
defmodule Temporal.Coresdk.ChildWorkflow.ChildWorkflowCancellationType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t ::
          integer
          | :ABANDON
          | :TRY_CANCEL
          | :WAIT_CANCELLATION_COMPLETED
          | :WAIT_CANCELLATION_REQUESTED

  field :ABANDON, 0
  field :TRY_CANCEL, 1
  field :WAIT_CANCELLATION_COMPLETED, 2
  field :WAIT_CANCELLATION_REQUESTED, 3
end
defmodule Temporal.Coresdk.ChildWorkflow.ChildWorkflowResult do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          status:
            {:completed, Temporal.Coresdk.ChildWorkflow.Success.t() | nil}
            | {:failed, Temporal.Coresdk.ChildWorkflow.Failure.t() | nil}
            | {:cancelled, Temporal.Coresdk.ChildWorkflow.Cancellation.t() | nil}
        }

  defstruct status: nil

  oneof :status, 0

  field :completed, 1, type: Temporal.Coresdk.ChildWorkflow.Success, oneof: 0
  field :failed, 2, type: Temporal.Coresdk.ChildWorkflow.Failure, oneof: 0
  field :cancelled, 3, type: Temporal.Coresdk.ChildWorkflow.Cancellation, oneof: 0
end
defmodule Temporal.Coresdk.ChildWorkflow.Success do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          result: Temporal.Coresdk.Common.Payload.t() | nil
        }

  defstruct result: nil

  field :result, 1, type: Temporal.Coresdk.Common.Payload
end
defmodule Temporal.Coresdk.ChildWorkflow.Failure do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          failure: Temporal.Temporal.Api.Failure.V1.Failure.t() | nil
        }

  defstruct failure: nil

  field :failure, 1, type: Temporal.Temporal.Api.Failure.V1.Failure
end
defmodule Temporal.Coresdk.ChildWorkflow.Cancellation do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          failure: Temporal.Temporal.Api.Failure.V1.Failure.t() | nil
        }

  defstruct failure: nil

  field :failure, 1, type: Temporal.Temporal.Api.Failure.V1.Failure
end

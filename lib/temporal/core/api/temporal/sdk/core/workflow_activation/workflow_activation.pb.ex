defmodule Temporal.Coresdk.WorkflowActivation.WorkflowActivation do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          run_id: String.t(),
          timestamp: Temporal.Google.Protobuf.Timestamp.t() | nil,
          is_replaying: boolean,
          jobs: [Temporal.Coresdk.WorkflowActivation.WorkflowActivationJob.t()]
        }

  defstruct run_id: "",
            timestamp: nil,
            is_replaying: false,
            jobs: []

  field :run_id, 1, type: :string, json_name: "runId"
  field :timestamp, 2, type: Temporal.Google.Protobuf.Timestamp
  field :is_replaying, 3, type: :bool, json_name: "isReplaying"
  field :jobs, 4, repeated: true, type: Temporal.Coresdk.WorkflowActivation.WorkflowActivationJob
end
defmodule Temporal.Coresdk.WorkflowActivation.WorkflowActivationJob do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          variant:
            {:start_workflow, Temporal.Coresdk.WorkflowActivation.StartWorkflow.t() | nil}
            | {:fire_timer, Temporal.Coresdk.WorkflowActivation.FireTimer.t() | nil}
            | {:update_random_seed,
               Temporal.Coresdk.WorkflowActivation.UpdateRandomSeed.t() | nil}
            | {:query_workflow, Temporal.Coresdk.WorkflowActivation.QueryWorkflow.t() | nil}
            | {:cancel_workflow, Temporal.Coresdk.WorkflowActivation.CancelWorkflow.t() | nil}
            | {:signal_workflow, Temporal.Coresdk.WorkflowActivation.SignalWorkflow.t() | nil}
            | {:resolve_activity, Temporal.Coresdk.WorkflowActivation.ResolveActivity.t() | nil}
            | {:notify_has_patch, Temporal.Coresdk.WorkflowActivation.NotifyHasPatch.t() | nil}
            | {:resolve_child_workflow_execution_start,
               Temporal.Coresdk.WorkflowActivation.ResolveChildWorkflowExecutionStart.t() | nil}
            | {:resolve_child_workflow_execution,
               Temporal.Coresdk.WorkflowActivation.ResolveChildWorkflowExecution.t() | nil}
            | {:resolve_signal_external_workflow,
               Temporal.Coresdk.WorkflowActivation.ResolveSignalExternalWorkflow.t() | nil}
            | {:resolve_request_cancel_external_workflow,
               Temporal.Coresdk.WorkflowActivation.ResolveRequestCancelExternalWorkflow.t() | nil}
            | {:remove_from_cache, Temporal.Coresdk.WorkflowActivation.RemoveFromCache.t() | nil}
        }

  defstruct variant: nil

  oneof :variant, 0

  field :start_workflow, 1,
    type: Temporal.Coresdk.WorkflowActivation.StartWorkflow,
    json_name: "startWorkflow",
    oneof: 0

  field :fire_timer, 2,
    type: Temporal.Coresdk.WorkflowActivation.FireTimer,
    json_name: "fireTimer",
    oneof: 0

  field :update_random_seed, 4,
    type: Temporal.Coresdk.WorkflowActivation.UpdateRandomSeed,
    json_name: "updateRandomSeed",
    oneof: 0

  field :query_workflow, 5,
    type: Temporal.Coresdk.WorkflowActivation.QueryWorkflow,
    json_name: "queryWorkflow",
    oneof: 0

  field :cancel_workflow, 6,
    type: Temporal.Coresdk.WorkflowActivation.CancelWorkflow,
    json_name: "cancelWorkflow",
    oneof: 0

  field :signal_workflow, 7,
    type: Temporal.Coresdk.WorkflowActivation.SignalWorkflow,
    json_name: "signalWorkflow",
    oneof: 0

  field :resolve_activity, 8,
    type: Temporal.Coresdk.WorkflowActivation.ResolveActivity,
    json_name: "resolveActivity",
    oneof: 0

  field :notify_has_patch, 9,
    type: Temporal.Coresdk.WorkflowActivation.NotifyHasPatch,
    json_name: "notifyHasPatch",
    oneof: 0

  field :resolve_child_workflow_execution_start, 10,
    type: Temporal.Coresdk.WorkflowActivation.ResolveChildWorkflowExecutionStart,
    json_name: "resolveChildWorkflowExecutionStart",
    oneof: 0

  field :resolve_child_workflow_execution, 11,
    type: Temporal.Coresdk.WorkflowActivation.ResolveChildWorkflowExecution,
    json_name: "resolveChildWorkflowExecution",
    oneof: 0

  field :resolve_signal_external_workflow, 12,
    type: Temporal.Coresdk.WorkflowActivation.ResolveSignalExternalWorkflow,
    json_name: "resolveSignalExternalWorkflow",
    oneof: 0

  field :resolve_request_cancel_external_workflow, 13,
    type: Temporal.Coresdk.WorkflowActivation.ResolveRequestCancelExternalWorkflow,
    json_name: "resolveRequestCancelExternalWorkflow",
    oneof: 0

  field :remove_from_cache, 50,
    type: Temporal.Coresdk.WorkflowActivation.RemoveFromCache,
    json_name: "removeFromCache",
    oneof: 0
end
defmodule Temporal.Coresdk.WorkflowActivation.StartWorkflow.HeadersEntry do
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
defmodule Temporal.Coresdk.WorkflowActivation.StartWorkflow do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          workflow_type: String.t(),
          workflow_id: String.t(),
          arguments: [Temporal.Coresdk.Common.Payload.t()],
          randomness_seed: non_neg_integer,
          headers: %{String.t() => Temporal.Coresdk.Common.Payload.t() | nil}
        }

  defstruct workflow_type: "",
            workflow_id: "",
            arguments: [],
            randomness_seed: 0,
            headers: %{}

  field :workflow_type, 1, type: :string, json_name: "workflowType"
  field :workflow_id, 2, type: :string, json_name: "workflowId"
  field :arguments, 3, repeated: true, type: Temporal.Coresdk.Common.Payload
  field :randomness_seed, 4, type: :uint64, json_name: "randomnessSeed"

  field :headers, 5,
    repeated: true,
    type: Temporal.Coresdk.WorkflowActivation.StartWorkflow.HeadersEntry,
    map: true
end
defmodule Temporal.Coresdk.WorkflowActivation.FireTimer do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          seq: non_neg_integer
        }

  defstruct seq: 0

  field :seq, 1, type: :uint32
end
defmodule Temporal.Coresdk.WorkflowActivation.ResolveActivity do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          seq: non_neg_integer,
          result: Temporal.Coresdk.ActivityResult.ActivityResolution.t() | nil
        }

  defstruct seq: 0,
            result: nil

  field :seq, 1, type: :uint32
  field :result, 2, type: Temporal.Coresdk.ActivityResult.ActivityResolution
end
defmodule Temporal.Coresdk.WorkflowActivation.ResolveChildWorkflowExecutionStart do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          status:
            {:succeeded,
             Temporal.Coresdk.WorkflowActivation.ResolveChildWorkflowExecutionStartSuccess.t()
             | nil}
            | {:failed,
               Temporal.Coresdk.WorkflowActivation.ResolveChildWorkflowExecutionStartFailure.t()
               | nil}
            | {:cancelled,
               Temporal.Coresdk.WorkflowActivation.ResolveChildWorkflowExecutionStartCancelled.t()
               | nil},
          seq: non_neg_integer
        }

  defstruct status: nil,
            seq: 0

  oneof :status, 0

  field :seq, 1, type: :uint32

  field :succeeded, 2,
    type: Temporal.Coresdk.WorkflowActivation.ResolveChildWorkflowExecutionStartSuccess,
    oneof: 0

  field :failed, 3,
    type: Temporal.Coresdk.WorkflowActivation.ResolveChildWorkflowExecutionStartFailure,
    oneof: 0

  field :cancelled, 4,
    type: Temporal.Coresdk.WorkflowActivation.ResolveChildWorkflowExecutionStartCancelled,
    oneof: 0
end
defmodule Temporal.Coresdk.WorkflowActivation.ResolveChildWorkflowExecutionStartSuccess do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          run_id: String.t()
        }

  defstruct run_id: ""

  field :run_id, 1, type: :string, json_name: "runId"
end
defmodule Temporal.Coresdk.WorkflowActivation.ResolveChildWorkflowExecutionStartFailure do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          workflow_id: String.t(),
          workflow_type: String.t(),
          cause: Temporal.Coresdk.ChildWorkflow.StartChildWorkflowExecutionFailedCause.t()
        }

  defstruct workflow_id: "",
            workflow_type: "",
            cause: :START_CHILD_WORKFLOW_EXECUTION_FAILED_CAUSE_UNSPECIFIED

  field :workflow_id, 1, type: :string, json_name: "workflowId"
  field :workflow_type, 2, type: :string, json_name: "workflowType"

  field :cause, 3,
    type: Temporal.Coresdk.ChildWorkflow.StartChildWorkflowExecutionFailedCause,
    enum: true
end
defmodule Temporal.Coresdk.WorkflowActivation.ResolveChildWorkflowExecutionStartCancelled do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          failure: Temporal.Temporal.Api.Failure.V1.Failure.t() | nil
        }

  defstruct failure: nil

  field :failure, 1, type: Temporal.Temporal.Api.Failure.V1.Failure
end
defmodule Temporal.Coresdk.WorkflowActivation.ResolveChildWorkflowExecution do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          seq: non_neg_integer,
          result: Temporal.Coresdk.ChildWorkflow.ChildWorkflowResult.t() | nil
        }

  defstruct seq: 0,
            result: nil

  field :seq, 1, type: :uint32
  field :result, 2, type: Temporal.Coresdk.ChildWorkflow.ChildWorkflowResult
end
defmodule Temporal.Coresdk.WorkflowActivation.UpdateRandomSeed do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          randomness_seed: non_neg_integer
        }

  defstruct randomness_seed: 0

  field :randomness_seed, 1, type: :uint64, json_name: "randomnessSeed"
end
defmodule Temporal.Coresdk.WorkflowActivation.QueryWorkflow do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          query_id: String.t(),
          query_type: String.t(),
          arguments: [Temporal.Coresdk.Common.Payload.t()]
        }

  defstruct query_id: "",
            query_type: "",
            arguments: []

  field :query_id, 1, type: :string, json_name: "queryId"
  field :query_type, 2, type: :string, json_name: "queryType"
  field :arguments, 3, repeated: true, type: Temporal.Coresdk.Common.Payload
end
defmodule Temporal.Coresdk.WorkflowActivation.CancelWorkflow do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          details: [Temporal.Coresdk.Common.Payload.t()]
        }

  defstruct details: []

  field :details, 1, repeated: true, type: Temporal.Coresdk.Common.Payload
end
defmodule Temporal.Coresdk.WorkflowActivation.SignalWorkflow do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          signal_name: String.t(),
          input: [Temporal.Coresdk.Common.Payload.t()],
          identity: String.t()
        }

  defstruct signal_name: "",
            input: [],
            identity: ""

  field :signal_name, 1, type: :string, json_name: "signalName"
  field :input, 2, repeated: true, type: Temporal.Coresdk.Common.Payload
  field :identity, 3, type: :string
end
defmodule Temporal.Coresdk.WorkflowActivation.NotifyHasPatch do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          patch_id: String.t()
        }

  defstruct patch_id: ""

  field :patch_id, 1, type: :string, json_name: "patchId"
end
defmodule Temporal.Coresdk.WorkflowActivation.ResolveSignalExternalWorkflow do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          seq: non_neg_integer,
          failure: Temporal.Temporal.Api.Failure.V1.Failure.t() | nil
        }

  defstruct seq: 0,
            failure: nil

  field :seq, 1, type: :uint32
  field :failure, 2, type: Temporal.Temporal.Api.Failure.V1.Failure
end
defmodule Temporal.Coresdk.WorkflowActivation.ResolveRequestCancelExternalWorkflow do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          seq: non_neg_integer,
          failure: Temporal.Temporal.Api.Failure.V1.Failure.t() | nil
        }

  defstruct seq: 0,
            failure: nil

  field :seq, 1, type: :uint32
  field :failure, 2, type: Temporal.Temporal.Api.Failure.V1.Failure
end
defmodule Temporal.Coresdk.WorkflowActivation.RemoveFromCache do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          reason: String.t()
        }

  defstruct reason: ""

  field :reason, 1, type: :string
end

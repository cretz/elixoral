defmodule Temporal.Coresdk.Common.WorkflowIdReusePolicy do
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
defmodule Temporal.Coresdk.Common.CancelExternalWorkflowExecutionFailedCause do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t ::
          integer
          | :CANCEL_EXTERNAL_WORKFLOW_EXECUTION_FAILED_CAUSE_UNSPECIFIED
          | :CANCEL_EXTERNAL_WORKFLOW_EXECUTION_FAILED_CAUSE_EXTERNAL_WORKFLOW_EXECUTION_NOT_FOUND

  field :CANCEL_EXTERNAL_WORKFLOW_EXECUTION_FAILED_CAUSE_UNSPECIFIED, 0
  field :CANCEL_EXTERNAL_WORKFLOW_EXECUTION_FAILED_CAUSE_EXTERNAL_WORKFLOW_EXECUTION_NOT_FOUND, 1
end
defmodule Temporal.Coresdk.Common.SignalExternalWorkflowExecutionFailedCause do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t ::
          integer
          | :SIGNAL_EXTERNAL_WORKFLOW_EXECUTION_FAILED_CAUSE_UNSPECIFIED
          | :SIGNAL_EXTERNAL_WORKFLOW_EXECUTION_FAILED_CAUSE_EXTERNAL_WORKFLOW_EXECUTION_NOT_FOUND

  field :SIGNAL_EXTERNAL_WORKFLOW_EXECUTION_FAILED_CAUSE_UNSPECIFIED, 0
  field :SIGNAL_EXTERNAL_WORKFLOW_EXECUTION_FAILED_CAUSE_EXTERNAL_WORKFLOW_EXECUTION_NOT_FOUND, 1
end
defmodule Temporal.Coresdk.Common.Payload.MetadataEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: binary
        }

  defstruct key: "",
            value: ""

  field :key, 1, type: :string
  field :value, 2, type: :bytes
end
defmodule Temporal.Coresdk.Common.Payload do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          metadata: %{String.t() => binary},
          data: binary
        }

  defstruct metadata: %{},
            data: ""

  field :metadata, 1,
    repeated: true,
    type: Temporal.Coresdk.Common.Payload.MetadataEntry,
    map: true

  field :data, 2, type: :bytes
end
defmodule Temporal.Coresdk.Common.WorkflowExecution do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          workflow_id: String.t(),
          run_id: String.t()
        }

  defstruct workflow_id: "",
            run_id: ""

  field :workflow_id, 1, type: :string, json_name: "workflowId"
  field :run_id, 2, type: :string, json_name: "runId"
end
defmodule Temporal.Coresdk.Common.NamespacedWorkflowExecution do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          namespace: String.t(),
          workflow_id: String.t(),
          run_id: String.t()
        }

  defstruct namespace: "",
            workflow_id: "",
            run_id: ""

  field :namespace, 1, type: :string
  field :workflow_id, 2, type: :string, json_name: "workflowId"
  field :run_id, 3, type: :string, json_name: "runId"
end
defmodule Temporal.Coresdk.Common.RetryPolicy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          initial_interval: Temporal.Google.Protobuf.Duration.t() | nil,
          backoff_coefficient: float | :infinity | :negative_infinity | :nan,
          maximum_interval: Temporal.Google.Protobuf.Duration.t() | nil,
          maximum_attempts: integer,
          non_retryable_error_types: [String.t()]
        }

  defstruct initial_interval: nil,
            backoff_coefficient: 0.0,
            maximum_interval: nil,
            maximum_attempts: 0,
            non_retryable_error_types: []

  field :initial_interval, 1,
    type: Temporal.Google.Protobuf.Duration,
    json_name: "initialInterval"

  field :backoff_coefficient, 2, type: :double, json_name: "backoffCoefficient"

  field :maximum_interval, 3,
    type: Temporal.Google.Protobuf.Duration,
    json_name: "maximumInterval"

  field :maximum_attempts, 4, type: :int32, json_name: "maximumAttempts"

  field :non_retryable_error_types, 5,
    repeated: true,
    type: :string,
    json_name: "nonRetryableErrorTypes"
end

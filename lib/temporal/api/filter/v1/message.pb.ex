defmodule Temporal.Api.Filter.V1.WorkflowExecutionFilter do
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
defmodule Temporal.Api.Filter.V1.WorkflowTypeFilter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t()
        }

  defstruct name: ""

  field :name, 1, type: :string
end
defmodule Temporal.Api.Filter.V1.StartTimeFilter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          earliest_time: Google.Protobuf.Timestamp.t() | nil,
          latest_time: Google.Protobuf.Timestamp.t() | nil
        }

  defstruct earliest_time: nil,
            latest_time: nil

  field :earliest_time, 1,
    type: Google.Protobuf.Timestamp,
    json_name: "earliestTime",
    deprecated: false

  field :latest_time, 2,
    type: Google.Protobuf.Timestamp,
    json_name: "latestTime",
    deprecated: false
end
defmodule Temporal.Api.Filter.V1.StatusFilter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          status: Temporal.Api.Enums.V1.WorkflowExecutionStatus.t()
        }

  defstruct status: :WORKFLOW_EXECUTION_STATUS_UNSPECIFIED

  field :status, 1, type: Temporal.Api.Enums.V1.WorkflowExecutionStatus, enum: true
end

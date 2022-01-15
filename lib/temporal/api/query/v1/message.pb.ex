defmodule Temporal.Api.Query.V1.WorkflowQuery do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          query_type: String.t(),
          query_args: Temporal.Api.Common.V1.Payloads.t() | nil,
          header: Temporal.Api.Common.V1.Header.t() | nil
        }

  defstruct query_type: "",
            query_args: nil,
            header: nil

  field :query_type, 1, type: :string, json_name: "queryType"
  field :query_args, 2, type: Temporal.Api.Common.V1.Payloads, json_name: "queryArgs"
  field :header, 3, type: Temporal.Api.Common.V1.Header
end
defmodule Temporal.Api.Query.V1.WorkflowQueryResult do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          result_type: Temporal.Api.Enums.V1.QueryResultType.t(),
          answer: Temporal.Api.Common.V1.Payloads.t() | nil,
          error_message: String.t()
        }

  defstruct result_type: :QUERY_RESULT_TYPE_UNSPECIFIED,
            answer: nil,
            error_message: ""

  field :result_type, 1,
    type: Temporal.Api.Enums.V1.QueryResultType,
    json_name: "resultType",
    enum: true

  field :answer, 2, type: Temporal.Api.Common.V1.Payloads
  field :error_message, 3, type: :string, json_name: "errorMessage"
end
defmodule Temporal.Api.Query.V1.QueryRejected do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          status: Temporal.Api.Enums.V1.WorkflowExecutionStatus.t()
        }

  defstruct status: :WORKFLOW_EXECUTION_STATUS_UNSPECIFIED

  field :status, 1, type: Temporal.Api.Enums.V1.WorkflowExecutionStatus, enum: true
end

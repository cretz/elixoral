defmodule Temporal.Api.Common.V1.DataBlob do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          encoding_type: Temporal.Api.Enums.V1.EncodingType.t(),
          data: binary
        }

  defstruct encoding_type: :ENCODING_TYPE_UNSPECIFIED,
            data: ""

  field :encoding_type, 1,
    type: Temporal.Api.Enums.V1.EncodingType,
    json_name: "encodingType",
    enum: true

  field :data, 2, type: :bytes
end
defmodule Temporal.Api.Common.V1.Payloads do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          payloads: [Temporal.Api.Common.V1.Payload.t()]
        }

  defstruct payloads: []

  field :payloads, 1, repeated: true, type: Temporal.Api.Common.V1.Payload
end
defmodule Temporal.Api.Common.V1.Payload.MetadataEntry do
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
defmodule Temporal.Api.Common.V1.Payload do
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
    type: Temporal.Api.Common.V1.Payload.MetadataEntry,
    map: true

  field :data, 2, type: :bytes
end
defmodule Temporal.Api.Common.V1.SearchAttributes.IndexedFieldsEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: Temporal.Api.Common.V1.Payload.t() | nil
        }

  defstruct key: "",
            value: nil

  field :key, 1, type: :string
  field :value, 2, type: Temporal.Api.Common.V1.Payload
end
defmodule Temporal.Api.Common.V1.SearchAttributes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          indexed_fields: %{String.t() => Temporal.Api.Common.V1.Payload.t() | nil}
        }

  defstruct indexed_fields: %{}

  field :indexed_fields, 1,
    repeated: true,
    type: Temporal.Api.Common.V1.SearchAttributes.IndexedFieldsEntry,
    json_name: "indexedFields",
    map: true
end
defmodule Temporal.Api.Common.V1.Memo.FieldsEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: Temporal.Api.Common.V1.Payload.t() | nil
        }

  defstruct key: "",
            value: nil

  field :key, 1, type: :string
  field :value, 2, type: Temporal.Api.Common.V1.Payload
end
defmodule Temporal.Api.Common.V1.Memo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          fields: %{String.t() => Temporal.Api.Common.V1.Payload.t() | nil}
        }

  defstruct fields: %{}

  field :fields, 1, repeated: true, type: Temporal.Api.Common.V1.Memo.FieldsEntry, map: true
end
defmodule Temporal.Api.Common.V1.Header.FieldsEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: Temporal.Api.Common.V1.Payload.t() | nil
        }

  defstruct key: "",
            value: nil

  field :key, 1, type: :string
  field :value, 2, type: Temporal.Api.Common.V1.Payload
end
defmodule Temporal.Api.Common.V1.Header do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          fields: %{String.t() => Temporal.Api.Common.V1.Payload.t() | nil}
        }

  defstruct fields: %{}

  field :fields, 1, repeated: true, type: Temporal.Api.Common.V1.Header.FieldsEntry, map: true
end
defmodule Temporal.Api.Common.V1.WorkflowExecution do
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
defmodule Temporal.Api.Common.V1.WorkflowType do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t()
        }

  defstruct name: ""

  field :name, 1, type: :string
end
defmodule Temporal.Api.Common.V1.ActivityType do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t()
        }

  defstruct name: ""

  field :name, 1, type: :string
end
defmodule Temporal.Api.Common.V1.RetryPolicy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          initial_interval: Google.Protobuf.Duration.t() | nil,
          backoff_coefficient: float | :infinity | :negative_infinity | :nan,
          maximum_interval: Google.Protobuf.Duration.t() | nil,
          maximum_attempts: integer,
          non_retryable_error_types: [String.t()]
        }

  defstruct initial_interval: nil,
            backoff_coefficient: 0.0,
            maximum_interval: nil,
            maximum_attempts: 0,
            non_retryable_error_types: []

  field :initial_interval, 1,
    type: Google.Protobuf.Duration,
    json_name: "initialInterval",
    deprecated: false

  field :backoff_coefficient, 2, type: :double, json_name: "backoffCoefficient"

  field :maximum_interval, 3,
    type: Google.Protobuf.Duration,
    json_name: "maximumInterval",
    deprecated: false

  field :maximum_attempts, 4, type: :int32, json_name: "maximumAttempts"

  field :non_retryable_error_types, 5,
    repeated: true,
    type: :string,
    json_name: "nonRetryableErrorTypes"
end

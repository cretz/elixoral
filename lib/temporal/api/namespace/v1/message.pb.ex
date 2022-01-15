defmodule Temporal.Api.Namespace.V1.NamespaceInfo.DataEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: String.t()
        }

  defstruct key: "",
            value: ""

  field :key, 1, type: :string
  field :value, 2, type: :string
end
defmodule Temporal.Api.Namespace.V1.NamespaceInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          state: Temporal.Api.Enums.V1.NamespaceState.t(),
          description: String.t(),
          owner_email: String.t(),
          data: %{String.t() => String.t()},
          id: String.t()
        }

  defstruct name: "",
            state: :NAMESPACE_STATE_UNSPECIFIED,
            description: "",
            owner_email: "",
            data: %{},
            id: ""

  field :name, 1, type: :string
  field :state, 2, type: Temporal.Api.Enums.V1.NamespaceState, enum: true
  field :description, 3, type: :string
  field :owner_email, 4, type: :string, json_name: "ownerEmail"

  field :data, 5,
    repeated: true,
    type: Temporal.Api.Namespace.V1.NamespaceInfo.DataEntry,
    map: true

  field :id, 6, type: :string
end
defmodule Temporal.Api.Namespace.V1.NamespaceConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          workflow_execution_retention_ttl: Google.Protobuf.Duration.t() | nil,
          bad_binaries: Temporal.Api.Namespace.V1.BadBinaries.t() | nil,
          history_archival_state: Temporal.Api.Enums.V1.ArchivalState.t(),
          history_archival_uri: String.t(),
          visibility_archival_state: Temporal.Api.Enums.V1.ArchivalState.t(),
          visibility_archival_uri: String.t()
        }

  defstruct workflow_execution_retention_ttl: nil,
            bad_binaries: nil,
            history_archival_state: :ARCHIVAL_STATE_UNSPECIFIED,
            history_archival_uri: "",
            visibility_archival_state: :ARCHIVAL_STATE_UNSPECIFIED,
            visibility_archival_uri: ""

  field :workflow_execution_retention_ttl, 1,
    type: Google.Protobuf.Duration,
    json_name: "workflowExecutionRetentionTtl",
    deprecated: false

  field :bad_binaries, 2, type: Temporal.Api.Namespace.V1.BadBinaries, json_name: "badBinaries"

  field :history_archival_state, 3,
    type: Temporal.Api.Enums.V1.ArchivalState,
    json_name: "historyArchivalState",
    enum: true

  field :history_archival_uri, 4, type: :string, json_name: "historyArchivalUri"

  field :visibility_archival_state, 5,
    type: Temporal.Api.Enums.V1.ArchivalState,
    json_name: "visibilityArchivalState",
    enum: true

  field :visibility_archival_uri, 6, type: :string, json_name: "visibilityArchivalUri"
end
defmodule Temporal.Api.Namespace.V1.BadBinaries.BinariesEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: Temporal.Api.Namespace.V1.BadBinaryInfo.t() | nil
        }

  defstruct key: "",
            value: nil

  field :key, 1, type: :string
  field :value, 2, type: Temporal.Api.Namespace.V1.BadBinaryInfo
end
defmodule Temporal.Api.Namespace.V1.BadBinaries do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          binaries: %{String.t() => Temporal.Api.Namespace.V1.BadBinaryInfo.t() | nil}
        }

  defstruct binaries: %{}

  field :binaries, 1,
    repeated: true,
    type: Temporal.Api.Namespace.V1.BadBinaries.BinariesEntry,
    map: true
end
defmodule Temporal.Api.Namespace.V1.BadBinaryInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          reason: String.t(),
          operator: String.t(),
          create_time: Google.Protobuf.Timestamp.t() | nil
        }

  defstruct reason: "",
            operator: "",
            create_time: nil

  field :reason, 1, type: :string
  field :operator, 2, type: :string

  field :create_time, 3,
    type: Google.Protobuf.Timestamp,
    json_name: "createTime",
    deprecated: false
end
defmodule Temporal.Api.Namespace.V1.UpdateNamespaceInfo.DataEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: String.t()
        }

  defstruct key: "",
            value: ""

  field :key, 1, type: :string
  field :value, 2, type: :string
end
defmodule Temporal.Api.Namespace.V1.UpdateNamespaceInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          description: String.t(),
          owner_email: String.t(),
          data: %{String.t() => String.t()},
          state: Temporal.Api.Enums.V1.NamespaceState.t()
        }

  defstruct description: "",
            owner_email: "",
            data: %{},
            state: :NAMESPACE_STATE_UNSPECIFIED

  field :description, 1, type: :string
  field :owner_email, 2, type: :string, json_name: "ownerEmail"

  field :data, 3,
    repeated: true,
    type: Temporal.Api.Namespace.V1.UpdateNamespaceInfo.DataEntry,
    map: true

  field :state, 4, type: Temporal.Api.Enums.V1.NamespaceState, enum: true
end

defmodule Temporal.Api.Version.V1.ReleaseInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          version: String.t(),
          release_time: Google.Protobuf.Timestamp.t() | nil,
          notes: String.t()
        }

  defstruct version: "",
            release_time: nil,
            notes: ""

  field :version, 1, type: :string

  field :release_time, 2,
    type: Google.Protobuf.Timestamp,
    json_name: "releaseTime",
    deprecated: false

  field :notes, 3, type: :string
end
defmodule Temporal.Api.Version.V1.Alert do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          message: String.t(),
          severity: Temporal.Api.Enums.V1.Severity.t()
        }

  defstruct message: "",
            severity: :SEVERITY_UNSPECIFIED

  field :message, 1, type: :string
  field :severity, 2, type: Temporal.Api.Enums.V1.Severity, enum: true
end
defmodule Temporal.Api.Version.V1.VersionInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          current: Temporal.Api.Version.V1.ReleaseInfo.t() | nil,
          recommended: Temporal.Api.Version.V1.ReleaseInfo.t() | nil,
          instructions: String.t(),
          alerts: [Temporal.Api.Version.V1.Alert.t()],
          last_update_time: Google.Protobuf.Timestamp.t() | nil
        }

  defstruct current: nil,
            recommended: nil,
            instructions: "",
            alerts: [],
            last_update_time: nil

  field :current, 1, type: Temporal.Api.Version.V1.ReleaseInfo
  field :recommended, 2, type: Temporal.Api.Version.V1.ReleaseInfo
  field :instructions, 3, type: :string
  field :alerts, 4, repeated: true, type: Temporal.Api.Version.V1.Alert

  field :last_update_time, 5,
    type: Google.Protobuf.Timestamp,
    json_name: "lastUpdateTime",
    deprecated: false
end

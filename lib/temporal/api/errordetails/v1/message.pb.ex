defmodule Temporal.Api.Errordetails.V1.NotFoundFailure do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          current_cluster: String.t(),
          active_cluster: String.t()
        }

  defstruct current_cluster: "",
            active_cluster: ""

  field :current_cluster, 1, type: :string, json_name: "currentCluster"
  field :active_cluster, 2, type: :string, json_name: "activeCluster"
end
defmodule Temporal.Api.Errordetails.V1.WorkflowExecutionAlreadyStartedFailure do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          start_request_id: String.t(),
          run_id: String.t()
        }

  defstruct start_request_id: "",
            run_id: ""

  field :start_request_id, 1, type: :string, json_name: "startRequestId"
  field :run_id, 2, type: :string, json_name: "runId"
end
defmodule Temporal.Api.Errordetails.V1.NamespaceNotActiveFailure do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          namespace: String.t(),
          current_cluster: String.t(),
          active_cluster: String.t()
        }

  defstruct namespace: "",
            current_cluster: "",
            active_cluster: ""

  field :namespace, 1, type: :string
  field :current_cluster, 2, type: :string, json_name: "currentCluster"
  field :active_cluster, 3, type: :string, json_name: "activeCluster"
end
defmodule Temporal.Api.Errordetails.V1.ClientVersionNotSupportedFailure do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          client_version: String.t(),
          client_name: String.t(),
          supported_versions: String.t()
        }

  defstruct client_version: "",
            client_name: "",
            supported_versions: ""

  field :client_version, 1, type: :string, json_name: "clientVersion"
  field :client_name, 2, type: :string, json_name: "clientName"
  field :supported_versions, 3, type: :string, json_name: "supportedVersions"
end
defmodule Temporal.Api.Errordetails.V1.ServerVersionNotSupportedFailure do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          server_version: String.t(),
          client_supported_server_versions: String.t()
        }

  defstruct server_version: "",
            client_supported_server_versions: ""

  field :server_version, 1, type: :string, json_name: "serverVersion"

  field :client_supported_server_versions, 2,
    type: :string,
    json_name: "clientSupportedServerVersions"
end
defmodule Temporal.Api.Errordetails.V1.NamespaceAlreadyExistsFailure do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}

  defstruct []
end
defmodule Temporal.Api.Errordetails.V1.CancellationAlreadyRequestedFailure do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}

  defstruct []
end
defmodule Temporal.Api.Errordetails.V1.QueryFailedFailure do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}

  defstruct []
end
defmodule Temporal.Api.Errordetails.V1.PermissionDeniedFailure do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          reason: String.t()
        }

  defstruct reason: ""

  field :reason, 1, type: :string
end

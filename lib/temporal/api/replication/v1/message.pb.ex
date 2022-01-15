defmodule Temporal.Api.Replication.V1.ClusterReplicationConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          cluster_name: String.t()
        }

  defstruct cluster_name: ""

  field :cluster_name, 1, type: :string, json_name: "clusterName"
end
defmodule Temporal.Api.Replication.V1.NamespaceReplicationConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          active_cluster_name: String.t(),
          clusters: [Temporal.Api.Replication.V1.ClusterReplicationConfig.t()]
        }

  defstruct active_cluster_name: "",
            clusters: []

  field :active_cluster_name, 1, type: :string, json_name: "activeClusterName"
  field :clusters, 2, repeated: true, type: Temporal.Api.Replication.V1.ClusterReplicationConfig
end

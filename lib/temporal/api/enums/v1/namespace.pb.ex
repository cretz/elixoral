defmodule Temporal.Api.Enums.V1.NamespaceState do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t ::
          integer
          | :NAMESPACE_STATE_UNSPECIFIED
          | :NAMESPACE_STATE_REGISTERED
          | :NAMESPACE_STATE_DEPRECATED
          | :NAMESPACE_STATE_DELETED
          | :NAMESPACE_STATE_HANDOVER

  field :NAMESPACE_STATE_UNSPECIFIED, 0
  field :NAMESPACE_STATE_REGISTERED, 1
  field :NAMESPACE_STATE_DEPRECATED, 2
  field :NAMESPACE_STATE_DELETED, 3
  field :NAMESPACE_STATE_HANDOVER, 4
end
defmodule Temporal.Api.Enums.V1.ArchivalState do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t ::
          integer
          | :ARCHIVAL_STATE_UNSPECIFIED
          | :ARCHIVAL_STATE_DISABLED
          | :ARCHIVAL_STATE_ENABLED

  field :ARCHIVAL_STATE_UNSPECIFIED, 0
  field :ARCHIVAL_STATE_DISABLED, 1
  field :ARCHIVAL_STATE_ENABLED, 2
end

defmodule Temporal.Api.Enums.V1.ResetReapplyType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t ::
          integer
          | :RESET_REAPPLY_TYPE_UNSPECIFIED
          | :RESET_REAPPLY_TYPE_SIGNAL
          | :RESET_REAPPLY_TYPE_NONE

  field :RESET_REAPPLY_TYPE_UNSPECIFIED, 0
  field :RESET_REAPPLY_TYPE_SIGNAL, 1
  field :RESET_REAPPLY_TYPE_NONE, 2
end

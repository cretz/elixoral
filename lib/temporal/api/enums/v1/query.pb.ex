defmodule Temporal.Api.Enums.V1.QueryResultType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t ::
          integer
          | :QUERY_RESULT_TYPE_UNSPECIFIED
          | :QUERY_RESULT_TYPE_ANSWERED
          | :QUERY_RESULT_TYPE_FAILED

  field :QUERY_RESULT_TYPE_UNSPECIFIED, 0
  field :QUERY_RESULT_TYPE_ANSWERED, 1
  field :QUERY_RESULT_TYPE_FAILED, 2
end
defmodule Temporal.Api.Enums.V1.QueryRejectCondition do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t ::
          integer
          | :QUERY_REJECT_CONDITION_UNSPECIFIED
          | :QUERY_REJECT_CONDITION_NONE
          | :QUERY_REJECT_CONDITION_NOT_OPEN
          | :QUERY_REJECT_CONDITION_NOT_COMPLETED_CLEANLY

  field :QUERY_REJECT_CONDITION_UNSPECIFIED, 0
  field :QUERY_REJECT_CONDITION_NONE, 1
  field :QUERY_REJECT_CONDITION_NOT_OPEN, 2
  field :QUERY_REJECT_CONDITION_NOT_COMPLETED_CLEANLY, 3
end

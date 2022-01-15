defmodule Temporal.Api.Enums.V1.EncodingType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :ENCODING_TYPE_UNSPECIFIED | :ENCODING_TYPE_PROTO3 | :ENCODING_TYPE_JSON

  field :ENCODING_TYPE_UNSPECIFIED, 0
  field :ENCODING_TYPE_PROTO3, 1
  field :ENCODING_TYPE_JSON, 2
end
defmodule Temporal.Api.Enums.V1.IndexedValueType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t ::
          integer
          | :INDEXED_VALUE_TYPE_UNSPECIFIED
          | :INDEXED_VALUE_TYPE_TEXT
          | :INDEXED_VALUE_TYPE_KEYWORD
          | :INDEXED_VALUE_TYPE_INT
          | :INDEXED_VALUE_TYPE_DOUBLE
          | :INDEXED_VALUE_TYPE_BOOL
          | :INDEXED_VALUE_TYPE_DATETIME

  field :INDEXED_VALUE_TYPE_UNSPECIFIED, 0
  field :INDEXED_VALUE_TYPE_TEXT, 1
  field :INDEXED_VALUE_TYPE_KEYWORD, 2
  field :INDEXED_VALUE_TYPE_INT, 3
  field :INDEXED_VALUE_TYPE_DOUBLE, 4
  field :INDEXED_VALUE_TYPE_BOOL, 5
  field :INDEXED_VALUE_TYPE_DATETIME, 6
end
defmodule Temporal.Api.Enums.V1.Severity do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :SEVERITY_UNSPECIFIED | :SEVERITY_HIGH | :SEVERITY_MEDIUM | :SEVERITY_LOW

  field :SEVERITY_UNSPECIFIED, 0
  field :SEVERITY_HIGH, 1
  field :SEVERITY_MEDIUM, 2
  field :SEVERITY_LOW, 3
end

defmodule Temporal.Coresdk.ActivityResult.ActivityExecutionResult do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          status:
            {:completed, Temporal.Coresdk.ActivityResult.Success.t() | nil}
            | {:failed, Temporal.Coresdk.ActivityResult.Failure.t() | nil}
            | {:cancelled, Temporal.Coresdk.ActivityResult.Cancellation.t() | nil}
            | {:will_complete_async, Temporal.Coresdk.ActivityResult.WillCompleteAsync.t() | nil}
        }

  defstruct status: nil

  oneof :status, 0

  field :completed, 1, type: Temporal.Coresdk.ActivityResult.Success, oneof: 0
  field :failed, 2, type: Temporal.Coresdk.ActivityResult.Failure, oneof: 0
  field :cancelled, 3, type: Temporal.Coresdk.ActivityResult.Cancellation, oneof: 0

  field :will_complete_async, 4,
    type: Temporal.Coresdk.ActivityResult.WillCompleteAsync,
    json_name: "willCompleteAsync",
    oneof: 0
end
defmodule Temporal.Coresdk.ActivityResult.ActivityResolution do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          status:
            {:completed, Temporal.Coresdk.ActivityResult.Success.t() | nil}
            | {:failed, Temporal.Coresdk.ActivityResult.Failure.t() | nil}
            | {:cancelled, Temporal.Coresdk.ActivityResult.Cancellation.t() | nil}
            | {:backoff, Temporal.Coresdk.ActivityResult.DoBackoff.t() | nil}
        }

  defstruct status: nil

  oneof :status, 0

  field :completed, 1, type: Temporal.Coresdk.ActivityResult.Success, oneof: 0
  field :failed, 2, type: Temporal.Coresdk.ActivityResult.Failure, oneof: 0
  field :cancelled, 3, type: Temporal.Coresdk.ActivityResult.Cancellation, oneof: 0
  field :backoff, 4, type: Temporal.Coresdk.ActivityResult.DoBackoff, oneof: 0
end
defmodule Temporal.Coresdk.ActivityResult.Success do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          result: Temporal.Coresdk.Common.Payload.t() | nil
        }

  defstruct result: nil

  field :result, 1, type: Temporal.Coresdk.Common.Payload
end
defmodule Temporal.Coresdk.ActivityResult.Failure do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          failure: Temporal.Temporal.Api.Failure.V1.Failure.t() | nil
        }

  defstruct failure: nil

  field :failure, 1, type: Temporal.Temporal.Api.Failure.V1.Failure
end
defmodule Temporal.Coresdk.ActivityResult.Cancellation do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          failure: Temporal.Temporal.Api.Failure.V1.Failure.t() | nil
        }

  defstruct failure: nil

  field :failure, 1, type: Temporal.Temporal.Api.Failure.V1.Failure
end
defmodule Temporal.Coresdk.ActivityResult.WillCompleteAsync do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}

  defstruct []
end
defmodule Temporal.Coresdk.ActivityResult.DoBackoff do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          attempt: non_neg_integer,
          backoff_duration: Temporal.Google.Protobuf.Duration.t() | nil,
          original_schedule_time: Temporal.Google.Protobuf.Timestamp.t() | nil
        }

  defstruct attempt: 0,
            backoff_duration: nil,
            original_schedule_time: nil

  field :attempt, 1, type: :uint32

  field :backoff_duration, 2,
    type: Temporal.Google.Protobuf.Duration,
    json_name: "backoffDuration"

  field :original_schedule_time, 3,
    type: Temporal.Google.Protobuf.Timestamp,
    json_name: "originalScheduleTime"
end

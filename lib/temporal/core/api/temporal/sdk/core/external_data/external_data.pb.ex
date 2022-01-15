defmodule Temporal.Coresdk.ExternalData.LocalActivityMarkerData do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          seq: non_neg_integer,
          attempt: non_neg_integer,
          activity_id: String.t(),
          activity_type: String.t(),
          complete_time: Temporal.Google.Protobuf.Timestamp.t() | nil,
          backoff: Temporal.Google.Protobuf.Duration.t() | nil,
          original_schedule_time: Temporal.Google.Protobuf.Timestamp.t() | nil
        }

  defstruct seq: 0,
            attempt: 0,
            activity_id: "",
            activity_type: "",
            complete_time: nil,
            backoff: nil,
            original_schedule_time: nil

  field :seq, 1, type: :uint32
  field :attempt, 2, type: :uint32
  field :activity_id, 3, type: :string, json_name: "activityId"
  field :activity_type, 4, type: :string, json_name: "activityType"
  field :complete_time, 5, type: Temporal.Google.Protobuf.Timestamp, json_name: "completeTime"
  field :backoff, 6, type: Temporal.Google.Protobuf.Duration

  field :original_schedule_time, 7,
    type: Temporal.Google.Protobuf.Timestamp,
    json_name: "originalScheduleTime"
end

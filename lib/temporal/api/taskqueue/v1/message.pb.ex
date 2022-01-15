defmodule Temporal.Api.Taskqueue.V1.TaskQueue do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          kind: Temporal.Api.Enums.V1.TaskQueueKind.t()
        }

  defstruct name: "",
            kind: :TASK_QUEUE_KIND_UNSPECIFIED

  field :name, 1, type: :string
  field :kind, 2, type: Temporal.Api.Enums.V1.TaskQueueKind, enum: true
end
defmodule Temporal.Api.Taskqueue.V1.TaskQueueMetadata do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          max_tasks_per_second: Google.Protobuf.DoubleValue.t() | nil
        }

  defstruct max_tasks_per_second: nil

  field :max_tasks_per_second, 1,
    type: Google.Protobuf.DoubleValue,
    json_name: "maxTasksPerSecond"
end
defmodule Temporal.Api.Taskqueue.V1.TaskQueueStatus do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          backlog_count_hint: integer,
          read_level: integer,
          ack_level: integer,
          rate_per_second: float | :infinity | :negative_infinity | :nan,
          task_id_block: Temporal.Api.Taskqueue.V1.TaskIdBlock.t() | nil
        }

  defstruct backlog_count_hint: 0,
            read_level: 0,
            ack_level: 0,
            rate_per_second: 0.0,
            task_id_block: nil

  field :backlog_count_hint, 1, type: :int64, json_name: "backlogCountHint"
  field :read_level, 2, type: :int64, json_name: "readLevel"
  field :ack_level, 3, type: :int64, json_name: "ackLevel"
  field :rate_per_second, 4, type: :double, json_name: "ratePerSecond"
  field :task_id_block, 5, type: Temporal.Api.Taskqueue.V1.TaskIdBlock, json_name: "taskIdBlock"
end
defmodule Temporal.Api.Taskqueue.V1.TaskIdBlock do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          start_id: integer,
          end_id: integer
        }

  defstruct start_id: 0,
            end_id: 0

  field :start_id, 1, type: :int64, json_name: "startId"
  field :end_id, 2, type: :int64, json_name: "endId"
end
defmodule Temporal.Api.Taskqueue.V1.TaskQueuePartitionMetadata do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          owner_host_name: String.t()
        }

  defstruct key: "",
            owner_host_name: ""

  field :key, 1, type: :string
  field :owner_host_name, 2, type: :string, json_name: "ownerHostName"
end
defmodule Temporal.Api.Taskqueue.V1.PollerInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          last_access_time: Google.Protobuf.Timestamp.t() | nil,
          identity: String.t(),
          rate_per_second: float | :infinity | :negative_infinity | :nan
        }

  defstruct last_access_time: nil,
            identity: "",
            rate_per_second: 0.0

  field :last_access_time, 1,
    type: Google.Protobuf.Timestamp,
    json_name: "lastAccessTime",
    deprecated: false

  field :identity, 2, type: :string
  field :rate_per_second, 3, type: :double, json_name: "ratePerSecond"
end
defmodule Temporal.Api.Taskqueue.V1.StickyExecutionAttributes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          worker_task_queue: Temporal.Api.Taskqueue.V1.TaskQueue.t() | nil,
          schedule_to_start_timeout: Google.Protobuf.Duration.t() | nil
        }

  defstruct worker_task_queue: nil,
            schedule_to_start_timeout: nil

  field :worker_task_queue, 1,
    type: Temporal.Api.Taskqueue.V1.TaskQueue,
    json_name: "workerTaskQueue"

  field :schedule_to_start_timeout, 2,
    type: Google.Protobuf.Duration,
    json_name: "scheduleToStartTimeout",
    deprecated: false
end

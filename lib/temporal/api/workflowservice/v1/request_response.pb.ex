defmodule Temporal.Api.Workflowservice.V1.RegisterNamespaceRequest.DataEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: String.t()
        }

  defstruct key: "",
            value: ""

  field :key, 1, type: :string
  field :value, 2, type: :string
end
defmodule Temporal.Api.Workflowservice.V1.RegisterNamespaceRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          namespace: String.t(),
          description: String.t(),
          owner_email: String.t(),
          workflow_execution_retention_period: Google.Protobuf.Duration.t() | nil,
          clusters: [Temporal.Api.Replication.V1.ClusterReplicationConfig.t()],
          active_cluster_name: String.t(),
          data: %{String.t() => String.t()},
          security_token: String.t(),
          is_global_namespace: boolean,
          history_archival_state: Temporal.Api.Enums.V1.ArchivalState.t(),
          history_archival_uri: String.t(),
          visibility_archival_state: Temporal.Api.Enums.V1.ArchivalState.t(),
          visibility_archival_uri: String.t()
        }

  defstruct namespace: "",
            description: "",
            owner_email: "",
            workflow_execution_retention_period: nil,
            clusters: [],
            active_cluster_name: "",
            data: %{},
            security_token: "",
            is_global_namespace: false,
            history_archival_state: :ARCHIVAL_STATE_UNSPECIFIED,
            history_archival_uri: "",
            visibility_archival_state: :ARCHIVAL_STATE_UNSPECIFIED,
            visibility_archival_uri: ""

  field :namespace, 1, type: :string
  field :description, 2, type: :string
  field :owner_email, 3, type: :string, json_name: "ownerEmail"

  field :workflow_execution_retention_period, 4,
    type: Google.Protobuf.Duration,
    json_name: "workflowExecutionRetentionPeriod",
    deprecated: false

  field :clusters, 5, repeated: true, type: Temporal.Api.Replication.V1.ClusterReplicationConfig
  field :active_cluster_name, 6, type: :string, json_name: "activeClusterName"

  field :data, 7,
    repeated: true,
    type: Temporal.Api.Workflowservice.V1.RegisterNamespaceRequest.DataEntry,
    map: true

  field :security_token, 8, type: :string, json_name: "securityToken"
  field :is_global_namespace, 9, type: :bool, json_name: "isGlobalNamespace"

  field :history_archival_state, 10,
    type: Temporal.Api.Enums.V1.ArchivalState,
    json_name: "historyArchivalState",
    enum: true

  field :history_archival_uri, 11, type: :string, json_name: "historyArchivalUri"

  field :visibility_archival_state, 12,
    type: Temporal.Api.Enums.V1.ArchivalState,
    json_name: "visibilityArchivalState",
    enum: true

  field :visibility_archival_uri, 13, type: :string, json_name: "visibilityArchivalUri"
end
defmodule Temporal.Api.Workflowservice.V1.RegisterNamespaceResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}

  defstruct []
end
defmodule Temporal.Api.Workflowservice.V1.ListNamespacesRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          page_size: integer,
          next_page_token: binary
        }

  defstruct page_size: 0,
            next_page_token: ""

  field :page_size, 1, type: :int32, json_name: "pageSize"
  field :next_page_token, 2, type: :bytes, json_name: "nextPageToken"
end
defmodule Temporal.Api.Workflowservice.V1.ListNamespacesResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          namespaces: [Temporal.Api.Workflowservice.V1.DescribeNamespaceResponse.t()],
          next_page_token: binary
        }

  defstruct namespaces: [],
            next_page_token: ""

  field :namespaces, 1,
    repeated: true,
    type: Temporal.Api.Workflowservice.V1.DescribeNamespaceResponse

  field :next_page_token, 2, type: :bytes, json_name: "nextPageToken"
end
defmodule Temporal.Api.Workflowservice.V1.DescribeNamespaceRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          namespace: String.t(),
          id: String.t()
        }

  defstruct namespace: "",
            id: ""

  field :namespace, 1, type: :string
  field :id, 2, type: :string
end
defmodule Temporal.Api.Workflowservice.V1.DescribeNamespaceResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          namespace_info: Temporal.Api.Namespace.V1.NamespaceInfo.t() | nil,
          config: Temporal.Api.Namespace.V1.NamespaceConfig.t() | nil,
          replication_config: Temporal.Api.Replication.V1.NamespaceReplicationConfig.t() | nil,
          failover_version: integer,
          is_global_namespace: boolean
        }

  defstruct namespace_info: nil,
            config: nil,
            replication_config: nil,
            failover_version: 0,
            is_global_namespace: false

  field :namespace_info, 1,
    type: Temporal.Api.Namespace.V1.NamespaceInfo,
    json_name: "namespaceInfo"

  field :config, 2, type: Temporal.Api.Namespace.V1.NamespaceConfig

  field :replication_config, 3,
    type: Temporal.Api.Replication.V1.NamespaceReplicationConfig,
    json_name: "replicationConfig"

  field :failover_version, 4, type: :int64, json_name: "failoverVersion"
  field :is_global_namespace, 5, type: :bool, json_name: "isGlobalNamespace"
end
defmodule Temporal.Api.Workflowservice.V1.UpdateNamespaceRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          namespace: String.t(),
          update_info: Temporal.Api.Namespace.V1.UpdateNamespaceInfo.t() | nil,
          config: Temporal.Api.Namespace.V1.NamespaceConfig.t() | nil,
          replication_config: Temporal.Api.Replication.V1.NamespaceReplicationConfig.t() | nil,
          security_token: String.t(),
          delete_bad_binary: String.t(),
          promote_namespace: boolean
        }

  defstruct namespace: "",
            update_info: nil,
            config: nil,
            replication_config: nil,
            security_token: "",
            delete_bad_binary: "",
            promote_namespace: false

  field :namespace, 1, type: :string

  field :update_info, 2,
    type: Temporal.Api.Namespace.V1.UpdateNamespaceInfo,
    json_name: "updateInfo"

  field :config, 3, type: Temporal.Api.Namespace.V1.NamespaceConfig

  field :replication_config, 4,
    type: Temporal.Api.Replication.V1.NamespaceReplicationConfig,
    json_name: "replicationConfig"

  field :security_token, 5, type: :string, json_name: "securityToken"
  field :delete_bad_binary, 6, type: :string, json_name: "deleteBadBinary"
  field :promote_namespace, 7, type: :bool, json_name: "promoteNamespace"
end
defmodule Temporal.Api.Workflowservice.V1.UpdateNamespaceResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          namespace_info: Temporal.Api.Namespace.V1.NamespaceInfo.t() | nil,
          config: Temporal.Api.Namespace.V1.NamespaceConfig.t() | nil,
          replication_config: Temporal.Api.Replication.V1.NamespaceReplicationConfig.t() | nil,
          failover_version: integer,
          is_global_namespace: boolean
        }

  defstruct namespace_info: nil,
            config: nil,
            replication_config: nil,
            failover_version: 0,
            is_global_namespace: false

  field :namespace_info, 1,
    type: Temporal.Api.Namespace.V1.NamespaceInfo,
    json_name: "namespaceInfo"

  field :config, 2, type: Temporal.Api.Namespace.V1.NamespaceConfig

  field :replication_config, 3,
    type: Temporal.Api.Replication.V1.NamespaceReplicationConfig,
    json_name: "replicationConfig"

  field :failover_version, 4, type: :int64, json_name: "failoverVersion"
  field :is_global_namespace, 5, type: :bool, json_name: "isGlobalNamespace"
end
defmodule Temporal.Api.Workflowservice.V1.DeprecateNamespaceRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          namespace: String.t(),
          security_token: String.t()
        }

  defstruct namespace: "",
            security_token: ""

  field :namespace, 1, type: :string
  field :security_token, 2, type: :string, json_name: "securityToken"
end
defmodule Temporal.Api.Workflowservice.V1.DeprecateNamespaceResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}

  defstruct []
end
defmodule Temporal.Api.Workflowservice.V1.StartWorkflowExecutionRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          namespace: String.t(),
          workflow_id: String.t(),
          workflow_type: Temporal.Api.Common.V1.WorkflowType.t() | nil,
          task_queue: Temporal.Api.Taskqueue.V1.TaskQueue.t() | nil,
          input: Temporal.Api.Common.V1.Payloads.t() | nil,
          workflow_execution_timeout: Google.Protobuf.Duration.t() | nil,
          workflow_run_timeout: Google.Protobuf.Duration.t() | nil,
          workflow_task_timeout: Google.Protobuf.Duration.t() | nil,
          identity: String.t(),
          request_id: String.t(),
          workflow_id_reuse_policy: Temporal.Api.Enums.V1.WorkflowIdReusePolicy.t(),
          retry_policy: Temporal.Api.Common.V1.RetryPolicy.t() | nil,
          cron_schedule: String.t(),
          memo: Temporal.Api.Common.V1.Memo.t() | nil,
          search_attributes: Temporal.Api.Common.V1.SearchAttributes.t() | nil,
          header: Temporal.Api.Common.V1.Header.t() | nil
        }

  defstruct namespace: "",
            workflow_id: "",
            workflow_type: nil,
            task_queue: nil,
            input: nil,
            workflow_execution_timeout: nil,
            workflow_run_timeout: nil,
            workflow_task_timeout: nil,
            identity: "",
            request_id: "",
            workflow_id_reuse_policy: :WORKFLOW_ID_REUSE_POLICY_UNSPECIFIED,
            retry_policy: nil,
            cron_schedule: "",
            memo: nil,
            search_attributes: nil,
            header: nil

  field :namespace, 1, type: :string
  field :workflow_id, 2, type: :string, json_name: "workflowId"
  field :workflow_type, 3, type: Temporal.Api.Common.V1.WorkflowType, json_name: "workflowType"
  field :task_queue, 4, type: Temporal.Api.Taskqueue.V1.TaskQueue, json_name: "taskQueue"
  field :input, 5, type: Temporal.Api.Common.V1.Payloads

  field :workflow_execution_timeout, 6,
    type: Google.Protobuf.Duration,
    json_name: "workflowExecutionTimeout",
    deprecated: false

  field :workflow_run_timeout, 7,
    type: Google.Protobuf.Duration,
    json_name: "workflowRunTimeout",
    deprecated: false

  field :workflow_task_timeout, 8,
    type: Google.Protobuf.Duration,
    json_name: "workflowTaskTimeout",
    deprecated: false

  field :identity, 9, type: :string
  field :request_id, 10, type: :string, json_name: "requestId"

  field :workflow_id_reuse_policy, 11,
    type: Temporal.Api.Enums.V1.WorkflowIdReusePolicy,
    json_name: "workflowIdReusePolicy",
    enum: true

  field :retry_policy, 12, type: Temporal.Api.Common.V1.RetryPolicy, json_name: "retryPolicy"
  field :cron_schedule, 13, type: :string, json_name: "cronSchedule"
  field :memo, 14, type: Temporal.Api.Common.V1.Memo

  field :search_attributes, 15,
    type: Temporal.Api.Common.V1.SearchAttributes,
    json_name: "searchAttributes"

  field :header, 16, type: Temporal.Api.Common.V1.Header
end
defmodule Temporal.Api.Workflowservice.V1.StartWorkflowExecutionResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          run_id: String.t()
        }

  defstruct run_id: ""

  field :run_id, 1, type: :string, json_name: "runId"
end
defmodule Temporal.Api.Workflowservice.V1.GetWorkflowExecutionHistoryRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          namespace: String.t(),
          execution: Temporal.Api.Common.V1.WorkflowExecution.t() | nil,
          maximum_page_size: integer,
          next_page_token: binary,
          wait_new_event: boolean,
          history_event_filter_type: Temporal.Api.Enums.V1.HistoryEventFilterType.t(),
          skip_archival: boolean
        }

  defstruct namespace: "",
            execution: nil,
            maximum_page_size: 0,
            next_page_token: "",
            wait_new_event: false,
            history_event_filter_type: :HISTORY_EVENT_FILTER_TYPE_UNSPECIFIED,
            skip_archival: false

  field :namespace, 1, type: :string
  field :execution, 2, type: Temporal.Api.Common.V1.WorkflowExecution
  field :maximum_page_size, 3, type: :int32, json_name: "maximumPageSize"
  field :next_page_token, 4, type: :bytes, json_name: "nextPageToken"
  field :wait_new_event, 5, type: :bool, json_name: "waitNewEvent"

  field :history_event_filter_type, 6,
    type: Temporal.Api.Enums.V1.HistoryEventFilterType,
    json_name: "historyEventFilterType",
    enum: true

  field :skip_archival, 7, type: :bool, json_name: "skipArchival"
end
defmodule Temporal.Api.Workflowservice.V1.GetWorkflowExecutionHistoryResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          history: Temporal.Api.History.V1.History.t() | nil,
          raw_history: [Temporal.Api.Common.V1.DataBlob.t()],
          next_page_token: binary,
          archived: boolean
        }

  defstruct history: nil,
            raw_history: [],
            next_page_token: "",
            archived: false

  field :history, 1, type: Temporal.Api.History.V1.History

  field :raw_history, 2,
    repeated: true,
    type: Temporal.Api.Common.V1.DataBlob,
    json_name: "rawHistory"

  field :next_page_token, 3, type: :bytes, json_name: "nextPageToken"
  field :archived, 4, type: :bool
end
defmodule Temporal.Api.Workflowservice.V1.PollWorkflowTaskQueueRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          namespace: String.t(),
          task_queue: Temporal.Api.Taskqueue.V1.TaskQueue.t() | nil,
          identity: String.t(),
          binary_checksum: String.t()
        }

  defstruct namespace: "",
            task_queue: nil,
            identity: "",
            binary_checksum: ""

  field :namespace, 1, type: :string
  field :task_queue, 2, type: Temporal.Api.Taskqueue.V1.TaskQueue, json_name: "taskQueue"
  field :identity, 3, type: :string
  field :binary_checksum, 4, type: :string, json_name: "binaryChecksum"
end
defmodule Temporal.Api.Workflowservice.V1.PollWorkflowTaskQueueResponse.QueriesEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: Temporal.Api.Query.V1.WorkflowQuery.t() | nil
        }

  defstruct key: "",
            value: nil

  field :key, 1, type: :string
  field :value, 2, type: Temporal.Api.Query.V1.WorkflowQuery
end
defmodule Temporal.Api.Workflowservice.V1.PollWorkflowTaskQueueResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          task_token: binary,
          workflow_execution: Temporal.Api.Common.V1.WorkflowExecution.t() | nil,
          workflow_type: Temporal.Api.Common.V1.WorkflowType.t() | nil,
          previous_started_event_id: integer,
          started_event_id: integer,
          attempt: integer,
          backlog_count_hint: integer,
          history: Temporal.Api.History.V1.History.t() | nil,
          next_page_token: binary,
          query: Temporal.Api.Query.V1.WorkflowQuery.t() | nil,
          workflow_execution_task_queue: Temporal.Api.Taskqueue.V1.TaskQueue.t() | nil,
          scheduled_time: Google.Protobuf.Timestamp.t() | nil,
          started_time: Google.Protobuf.Timestamp.t() | nil,
          queries: %{String.t() => Temporal.Api.Query.V1.WorkflowQuery.t() | nil}
        }

  defstruct task_token: "",
            workflow_execution: nil,
            workflow_type: nil,
            previous_started_event_id: 0,
            started_event_id: 0,
            attempt: 0,
            backlog_count_hint: 0,
            history: nil,
            next_page_token: "",
            query: nil,
            workflow_execution_task_queue: nil,
            scheduled_time: nil,
            started_time: nil,
            queries: %{}

  field :task_token, 1, type: :bytes, json_name: "taskToken"

  field :workflow_execution, 2,
    type: Temporal.Api.Common.V1.WorkflowExecution,
    json_name: "workflowExecution"

  field :workflow_type, 3, type: Temporal.Api.Common.V1.WorkflowType, json_name: "workflowType"
  field :previous_started_event_id, 4, type: :int64, json_name: "previousStartedEventId"
  field :started_event_id, 5, type: :int64, json_name: "startedEventId"
  field :attempt, 6, type: :int32
  field :backlog_count_hint, 7, type: :int64, json_name: "backlogCountHint"
  field :history, 8, type: Temporal.Api.History.V1.History
  field :next_page_token, 9, type: :bytes, json_name: "nextPageToken"
  field :query, 10, type: Temporal.Api.Query.V1.WorkflowQuery

  field :workflow_execution_task_queue, 11,
    type: Temporal.Api.Taskqueue.V1.TaskQueue,
    json_name: "workflowExecutionTaskQueue"

  field :scheduled_time, 12,
    type: Google.Protobuf.Timestamp,
    json_name: "scheduledTime",
    deprecated: false

  field :started_time, 13,
    type: Google.Protobuf.Timestamp,
    json_name: "startedTime",
    deprecated: false

  field :queries, 14,
    repeated: true,
    type: Temporal.Api.Workflowservice.V1.PollWorkflowTaskQueueResponse.QueriesEntry,
    map: true
end
defmodule Temporal.Api.Workflowservice.V1.RespondWorkflowTaskCompletedRequest.QueryResultsEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: Temporal.Api.Query.V1.WorkflowQueryResult.t() | nil
        }

  defstruct key: "",
            value: nil

  field :key, 1, type: :string
  field :value, 2, type: Temporal.Api.Query.V1.WorkflowQueryResult
end
defmodule Temporal.Api.Workflowservice.V1.RespondWorkflowTaskCompletedRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          task_token: binary,
          commands: [Temporal.Api.Command.V1.Command.t()],
          identity: String.t(),
          sticky_attributes: Temporal.Api.Taskqueue.V1.StickyExecutionAttributes.t() | nil,
          return_new_workflow_task: boolean,
          force_create_new_workflow_task: boolean,
          binary_checksum: String.t(),
          query_results: %{String.t() => Temporal.Api.Query.V1.WorkflowQueryResult.t() | nil},
          namespace: String.t()
        }

  defstruct task_token: "",
            commands: [],
            identity: "",
            sticky_attributes: nil,
            return_new_workflow_task: false,
            force_create_new_workflow_task: false,
            binary_checksum: "",
            query_results: %{},
            namespace: ""

  field :task_token, 1, type: :bytes, json_name: "taskToken"
  field :commands, 2, repeated: true, type: Temporal.Api.Command.V1.Command
  field :identity, 3, type: :string

  field :sticky_attributes, 4,
    type: Temporal.Api.Taskqueue.V1.StickyExecutionAttributes,
    json_name: "stickyAttributes"

  field :return_new_workflow_task, 5, type: :bool, json_name: "returnNewWorkflowTask"
  field :force_create_new_workflow_task, 6, type: :bool, json_name: "forceCreateNewWorkflowTask"
  field :binary_checksum, 7, type: :string, json_name: "binaryChecksum"

  field :query_results, 8,
    repeated: true,
    type: Temporal.Api.Workflowservice.V1.RespondWorkflowTaskCompletedRequest.QueryResultsEntry,
    json_name: "queryResults",
    map: true

  field :namespace, 9, type: :string
end
defmodule Temporal.Api.Workflowservice.V1.RespondWorkflowTaskCompletedResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          workflow_task: Temporal.Api.Workflowservice.V1.PollWorkflowTaskQueueResponse.t() | nil
        }

  defstruct workflow_task: nil

  field :workflow_task, 1,
    type: Temporal.Api.Workflowservice.V1.PollWorkflowTaskQueueResponse,
    json_name: "workflowTask"
end
defmodule Temporal.Api.Workflowservice.V1.RespondWorkflowTaskFailedRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          task_token: binary,
          cause: Temporal.Api.Enums.V1.WorkflowTaskFailedCause.t(),
          failure: Temporal.Api.Failure.V1.Failure.t() | nil,
          identity: String.t(),
          binary_checksum: String.t(),
          namespace: String.t()
        }

  defstruct task_token: "",
            cause: :WORKFLOW_TASK_FAILED_CAUSE_UNSPECIFIED,
            failure: nil,
            identity: "",
            binary_checksum: "",
            namespace: ""

  field :task_token, 1, type: :bytes, json_name: "taskToken"
  field :cause, 2, type: Temporal.Api.Enums.V1.WorkflowTaskFailedCause, enum: true
  field :failure, 3, type: Temporal.Api.Failure.V1.Failure
  field :identity, 4, type: :string
  field :binary_checksum, 5, type: :string, json_name: "binaryChecksum"
  field :namespace, 6, type: :string
end
defmodule Temporal.Api.Workflowservice.V1.RespondWorkflowTaskFailedResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}

  defstruct []
end
defmodule Temporal.Api.Workflowservice.V1.PollActivityTaskQueueRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          namespace: String.t(),
          task_queue: Temporal.Api.Taskqueue.V1.TaskQueue.t() | nil,
          identity: String.t(),
          task_queue_metadata: Temporal.Api.Taskqueue.V1.TaskQueueMetadata.t() | nil
        }

  defstruct namespace: "",
            task_queue: nil,
            identity: "",
            task_queue_metadata: nil

  field :namespace, 1, type: :string
  field :task_queue, 2, type: Temporal.Api.Taskqueue.V1.TaskQueue, json_name: "taskQueue"
  field :identity, 3, type: :string

  field :task_queue_metadata, 4,
    type: Temporal.Api.Taskqueue.V1.TaskQueueMetadata,
    json_name: "taskQueueMetadata"
end
defmodule Temporal.Api.Workflowservice.V1.PollActivityTaskQueueResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          task_token: binary,
          workflow_namespace: String.t(),
          workflow_type: Temporal.Api.Common.V1.WorkflowType.t() | nil,
          workflow_execution: Temporal.Api.Common.V1.WorkflowExecution.t() | nil,
          activity_type: Temporal.Api.Common.V1.ActivityType.t() | nil,
          activity_id: String.t(),
          header: Temporal.Api.Common.V1.Header.t() | nil,
          input: Temporal.Api.Common.V1.Payloads.t() | nil,
          heartbeat_details: Temporal.Api.Common.V1.Payloads.t() | nil,
          scheduled_time: Google.Protobuf.Timestamp.t() | nil,
          current_attempt_scheduled_time: Google.Protobuf.Timestamp.t() | nil,
          started_time: Google.Protobuf.Timestamp.t() | nil,
          attempt: integer,
          schedule_to_close_timeout: Google.Protobuf.Duration.t() | nil,
          start_to_close_timeout: Google.Protobuf.Duration.t() | nil,
          heartbeat_timeout: Google.Protobuf.Duration.t() | nil,
          retry_policy: Temporal.Api.Common.V1.RetryPolicy.t() | nil
        }

  defstruct task_token: "",
            workflow_namespace: "",
            workflow_type: nil,
            workflow_execution: nil,
            activity_type: nil,
            activity_id: "",
            header: nil,
            input: nil,
            heartbeat_details: nil,
            scheduled_time: nil,
            current_attempt_scheduled_time: nil,
            started_time: nil,
            attempt: 0,
            schedule_to_close_timeout: nil,
            start_to_close_timeout: nil,
            heartbeat_timeout: nil,
            retry_policy: nil

  field :task_token, 1, type: :bytes, json_name: "taskToken"
  field :workflow_namespace, 2, type: :string, json_name: "workflowNamespace"
  field :workflow_type, 3, type: Temporal.Api.Common.V1.WorkflowType, json_name: "workflowType"

  field :workflow_execution, 4,
    type: Temporal.Api.Common.V1.WorkflowExecution,
    json_name: "workflowExecution"

  field :activity_type, 5, type: Temporal.Api.Common.V1.ActivityType, json_name: "activityType"
  field :activity_id, 6, type: :string, json_name: "activityId"
  field :header, 7, type: Temporal.Api.Common.V1.Header
  field :input, 8, type: Temporal.Api.Common.V1.Payloads

  field :heartbeat_details, 9,
    type: Temporal.Api.Common.V1.Payloads,
    json_name: "heartbeatDetails"

  field :scheduled_time, 10,
    type: Google.Protobuf.Timestamp,
    json_name: "scheduledTime",
    deprecated: false

  field :current_attempt_scheduled_time, 11,
    type: Google.Protobuf.Timestamp,
    json_name: "currentAttemptScheduledTime",
    deprecated: false

  field :started_time, 12,
    type: Google.Protobuf.Timestamp,
    json_name: "startedTime",
    deprecated: false

  field :attempt, 13, type: :int32

  field :schedule_to_close_timeout, 14,
    type: Google.Protobuf.Duration,
    json_name: "scheduleToCloseTimeout",
    deprecated: false

  field :start_to_close_timeout, 15,
    type: Google.Protobuf.Duration,
    json_name: "startToCloseTimeout",
    deprecated: false

  field :heartbeat_timeout, 16,
    type: Google.Protobuf.Duration,
    json_name: "heartbeatTimeout",
    deprecated: false

  field :retry_policy, 17, type: Temporal.Api.Common.V1.RetryPolicy, json_name: "retryPolicy"
end
defmodule Temporal.Api.Workflowservice.V1.RecordActivityTaskHeartbeatRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          task_token: binary,
          details: Temporal.Api.Common.V1.Payloads.t() | nil,
          identity: String.t(),
          namespace: String.t()
        }

  defstruct task_token: "",
            details: nil,
            identity: "",
            namespace: ""

  field :task_token, 1, type: :bytes, json_name: "taskToken"
  field :details, 2, type: Temporal.Api.Common.V1.Payloads
  field :identity, 3, type: :string
  field :namespace, 4, type: :string
end
defmodule Temporal.Api.Workflowservice.V1.RecordActivityTaskHeartbeatResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          cancel_requested: boolean
        }

  defstruct cancel_requested: false

  field :cancel_requested, 1, type: :bool, json_name: "cancelRequested"
end
defmodule Temporal.Api.Workflowservice.V1.RecordActivityTaskHeartbeatByIdRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          namespace: String.t(),
          workflow_id: String.t(),
          run_id: String.t(),
          activity_id: String.t(),
          details: Temporal.Api.Common.V1.Payloads.t() | nil,
          identity: String.t()
        }

  defstruct namespace: "",
            workflow_id: "",
            run_id: "",
            activity_id: "",
            details: nil,
            identity: ""

  field :namespace, 1, type: :string
  field :workflow_id, 2, type: :string, json_name: "workflowId"
  field :run_id, 3, type: :string, json_name: "runId"
  field :activity_id, 4, type: :string, json_name: "activityId"
  field :details, 5, type: Temporal.Api.Common.V1.Payloads
  field :identity, 6, type: :string
end
defmodule Temporal.Api.Workflowservice.V1.RecordActivityTaskHeartbeatByIdResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          cancel_requested: boolean
        }

  defstruct cancel_requested: false

  field :cancel_requested, 1, type: :bool, json_name: "cancelRequested"
end
defmodule Temporal.Api.Workflowservice.V1.RespondActivityTaskCompletedRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          task_token: binary,
          result: Temporal.Api.Common.V1.Payloads.t() | nil,
          identity: String.t(),
          namespace: String.t()
        }

  defstruct task_token: "",
            result: nil,
            identity: "",
            namespace: ""

  field :task_token, 1, type: :bytes, json_name: "taskToken"
  field :result, 2, type: Temporal.Api.Common.V1.Payloads
  field :identity, 3, type: :string
  field :namespace, 4, type: :string
end
defmodule Temporal.Api.Workflowservice.V1.RespondActivityTaskCompletedResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}

  defstruct []
end
defmodule Temporal.Api.Workflowservice.V1.RespondActivityTaskCompletedByIdRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          namespace: String.t(),
          workflow_id: String.t(),
          run_id: String.t(),
          activity_id: String.t(),
          result: Temporal.Api.Common.V1.Payloads.t() | nil,
          identity: String.t()
        }

  defstruct namespace: "",
            workflow_id: "",
            run_id: "",
            activity_id: "",
            result: nil,
            identity: ""

  field :namespace, 1, type: :string
  field :workflow_id, 2, type: :string, json_name: "workflowId"
  field :run_id, 3, type: :string, json_name: "runId"
  field :activity_id, 4, type: :string, json_name: "activityId"
  field :result, 5, type: Temporal.Api.Common.V1.Payloads
  field :identity, 6, type: :string
end
defmodule Temporal.Api.Workflowservice.V1.RespondActivityTaskCompletedByIdResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}

  defstruct []
end
defmodule Temporal.Api.Workflowservice.V1.RespondActivityTaskFailedRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          task_token: binary,
          failure: Temporal.Api.Failure.V1.Failure.t() | nil,
          identity: String.t(),
          namespace: String.t()
        }

  defstruct task_token: "",
            failure: nil,
            identity: "",
            namespace: ""

  field :task_token, 1, type: :bytes, json_name: "taskToken"
  field :failure, 2, type: Temporal.Api.Failure.V1.Failure
  field :identity, 3, type: :string
  field :namespace, 4, type: :string
end
defmodule Temporal.Api.Workflowservice.V1.RespondActivityTaskFailedResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}

  defstruct []
end
defmodule Temporal.Api.Workflowservice.V1.RespondActivityTaskFailedByIdRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          namespace: String.t(),
          workflow_id: String.t(),
          run_id: String.t(),
          activity_id: String.t(),
          failure: Temporal.Api.Failure.V1.Failure.t() | nil,
          identity: String.t()
        }

  defstruct namespace: "",
            workflow_id: "",
            run_id: "",
            activity_id: "",
            failure: nil,
            identity: ""

  field :namespace, 1, type: :string
  field :workflow_id, 2, type: :string, json_name: "workflowId"
  field :run_id, 3, type: :string, json_name: "runId"
  field :activity_id, 4, type: :string, json_name: "activityId"
  field :failure, 5, type: Temporal.Api.Failure.V1.Failure
  field :identity, 6, type: :string
end
defmodule Temporal.Api.Workflowservice.V1.RespondActivityTaskFailedByIdResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}

  defstruct []
end
defmodule Temporal.Api.Workflowservice.V1.RespondActivityTaskCanceledRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          task_token: binary,
          details: Temporal.Api.Common.V1.Payloads.t() | nil,
          identity: String.t(),
          namespace: String.t()
        }

  defstruct task_token: "",
            details: nil,
            identity: "",
            namespace: ""

  field :task_token, 1, type: :bytes, json_name: "taskToken"
  field :details, 2, type: Temporal.Api.Common.V1.Payloads
  field :identity, 3, type: :string
  field :namespace, 4, type: :string
end
defmodule Temporal.Api.Workflowservice.V1.RespondActivityTaskCanceledResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}

  defstruct []
end
defmodule Temporal.Api.Workflowservice.V1.RespondActivityTaskCanceledByIdRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          namespace: String.t(),
          workflow_id: String.t(),
          run_id: String.t(),
          activity_id: String.t(),
          details: Temporal.Api.Common.V1.Payloads.t() | nil,
          identity: String.t()
        }

  defstruct namespace: "",
            workflow_id: "",
            run_id: "",
            activity_id: "",
            details: nil,
            identity: ""

  field :namespace, 1, type: :string
  field :workflow_id, 2, type: :string, json_name: "workflowId"
  field :run_id, 3, type: :string, json_name: "runId"
  field :activity_id, 4, type: :string, json_name: "activityId"
  field :details, 5, type: Temporal.Api.Common.V1.Payloads
  field :identity, 6, type: :string
end
defmodule Temporal.Api.Workflowservice.V1.RespondActivityTaskCanceledByIdResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}

  defstruct []
end
defmodule Temporal.Api.Workflowservice.V1.RequestCancelWorkflowExecutionRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          namespace: String.t(),
          workflow_execution: Temporal.Api.Common.V1.WorkflowExecution.t() | nil,
          identity: String.t(),
          request_id: String.t(),
          first_execution_run_id: String.t()
        }

  defstruct namespace: "",
            workflow_execution: nil,
            identity: "",
            request_id: "",
            first_execution_run_id: ""

  field :namespace, 1, type: :string

  field :workflow_execution, 2,
    type: Temporal.Api.Common.V1.WorkflowExecution,
    json_name: "workflowExecution"

  field :identity, 3, type: :string
  field :request_id, 4, type: :string, json_name: "requestId"
  field :first_execution_run_id, 5, type: :string, json_name: "firstExecutionRunId"
end
defmodule Temporal.Api.Workflowservice.V1.RequestCancelWorkflowExecutionResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}

  defstruct []
end
defmodule Temporal.Api.Workflowservice.V1.SignalWorkflowExecutionRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          namespace: String.t(),
          workflow_execution: Temporal.Api.Common.V1.WorkflowExecution.t() | nil,
          signal_name: String.t(),
          input: Temporal.Api.Common.V1.Payloads.t() | nil,
          identity: String.t(),
          request_id: String.t(),
          control: String.t(),
          header: Temporal.Api.Common.V1.Header.t() | nil
        }

  defstruct namespace: "",
            workflow_execution: nil,
            signal_name: "",
            input: nil,
            identity: "",
            request_id: "",
            control: "",
            header: nil

  field :namespace, 1, type: :string

  field :workflow_execution, 2,
    type: Temporal.Api.Common.V1.WorkflowExecution,
    json_name: "workflowExecution"

  field :signal_name, 3, type: :string, json_name: "signalName"
  field :input, 4, type: Temporal.Api.Common.V1.Payloads
  field :identity, 5, type: :string
  field :request_id, 6, type: :string, json_name: "requestId"
  field :control, 7, type: :string
  field :header, 8, type: Temporal.Api.Common.V1.Header
end
defmodule Temporal.Api.Workflowservice.V1.SignalWorkflowExecutionResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}

  defstruct []
end
defmodule Temporal.Api.Workflowservice.V1.SignalWithStartWorkflowExecutionRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          namespace: String.t(),
          workflow_id: String.t(),
          workflow_type: Temporal.Api.Common.V1.WorkflowType.t() | nil,
          task_queue: Temporal.Api.Taskqueue.V1.TaskQueue.t() | nil,
          input: Temporal.Api.Common.V1.Payloads.t() | nil,
          workflow_execution_timeout: Google.Protobuf.Duration.t() | nil,
          workflow_run_timeout: Google.Protobuf.Duration.t() | nil,
          workflow_task_timeout: Google.Protobuf.Duration.t() | nil,
          identity: String.t(),
          request_id: String.t(),
          workflow_id_reuse_policy: Temporal.Api.Enums.V1.WorkflowIdReusePolicy.t(),
          signal_name: String.t(),
          signal_input: Temporal.Api.Common.V1.Payloads.t() | nil,
          control: String.t(),
          retry_policy: Temporal.Api.Common.V1.RetryPolicy.t() | nil,
          cron_schedule: String.t(),
          memo: Temporal.Api.Common.V1.Memo.t() | nil,
          search_attributes: Temporal.Api.Common.V1.SearchAttributes.t() | nil,
          header: Temporal.Api.Common.V1.Header.t() | nil
        }

  defstruct namespace: "",
            workflow_id: "",
            workflow_type: nil,
            task_queue: nil,
            input: nil,
            workflow_execution_timeout: nil,
            workflow_run_timeout: nil,
            workflow_task_timeout: nil,
            identity: "",
            request_id: "",
            workflow_id_reuse_policy: :WORKFLOW_ID_REUSE_POLICY_UNSPECIFIED,
            signal_name: "",
            signal_input: nil,
            control: "",
            retry_policy: nil,
            cron_schedule: "",
            memo: nil,
            search_attributes: nil,
            header: nil

  field :namespace, 1, type: :string
  field :workflow_id, 2, type: :string, json_name: "workflowId"
  field :workflow_type, 3, type: Temporal.Api.Common.V1.WorkflowType, json_name: "workflowType"
  field :task_queue, 4, type: Temporal.Api.Taskqueue.V1.TaskQueue, json_name: "taskQueue"
  field :input, 5, type: Temporal.Api.Common.V1.Payloads

  field :workflow_execution_timeout, 6,
    type: Google.Protobuf.Duration,
    json_name: "workflowExecutionTimeout",
    deprecated: false

  field :workflow_run_timeout, 7,
    type: Google.Protobuf.Duration,
    json_name: "workflowRunTimeout",
    deprecated: false

  field :workflow_task_timeout, 8,
    type: Google.Protobuf.Duration,
    json_name: "workflowTaskTimeout",
    deprecated: false

  field :identity, 9, type: :string
  field :request_id, 10, type: :string, json_name: "requestId"

  field :workflow_id_reuse_policy, 11,
    type: Temporal.Api.Enums.V1.WorkflowIdReusePolicy,
    json_name: "workflowIdReusePolicy",
    enum: true

  field :signal_name, 12, type: :string, json_name: "signalName"
  field :signal_input, 13, type: Temporal.Api.Common.V1.Payloads, json_name: "signalInput"
  field :control, 14, type: :string
  field :retry_policy, 15, type: Temporal.Api.Common.V1.RetryPolicy, json_name: "retryPolicy"
  field :cron_schedule, 16, type: :string, json_name: "cronSchedule"
  field :memo, 17, type: Temporal.Api.Common.V1.Memo

  field :search_attributes, 18,
    type: Temporal.Api.Common.V1.SearchAttributes,
    json_name: "searchAttributes"

  field :header, 19, type: Temporal.Api.Common.V1.Header
end
defmodule Temporal.Api.Workflowservice.V1.SignalWithStartWorkflowExecutionResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          run_id: String.t()
        }

  defstruct run_id: ""

  field :run_id, 1, type: :string, json_name: "runId"
end
defmodule Temporal.Api.Workflowservice.V1.ResetWorkflowExecutionRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          namespace: String.t(),
          workflow_execution: Temporal.Api.Common.V1.WorkflowExecution.t() | nil,
          reason: String.t(),
          workflow_task_finish_event_id: integer,
          request_id: String.t(),
          reset_reapply_type: Temporal.Api.Enums.V1.ResetReapplyType.t()
        }

  defstruct namespace: "",
            workflow_execution: nil,
            reason: "",
            workflow_task_finish_event_id: 0,
            request_id: "",
            reset_reapply_type: :RESET_REAPPLY_TYPE_UNSPECIFIED

  field :namespace, 1, type: :string

  field :workflow_execution, 2,
    type: Temporal.Api.Common.V1.WorkflowExecution,
    json_name: "workflowExecution"

  field :reason, 3, type: :string
  field :workflow_task_finish_event_id, 4, type: :int64, json_name: "workflowTaskFinishEventId"
  field :request_id, 5, type: :string, json_name: "requestId"

  field :reset_reapply_type, 6,
    type: Temporal.Api.Enums.V1.ResetReapplyType,
    json_name: "resetReapplyType",
    enum: true
end
defmodule Temporal.Api.Workflowservice.V1.ResetWorkflowExecutionResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          run_id: String.t()
        }

  defstruct run_id: ""

  field :run_id, 1, type: :string, json_name: "runId"
end
defmodule Temporal.Api.Workflowservice.V1.TerminateWorkflowExecutionRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          namespace: String.t(),
          workflow_execution: Temporal.Api.Common.V1.WorkflowExecution.t() | nil,
          reason: String.t(),
          details: Temporal.Api.Common.V1.Payloads.t() | nil,
          identity: String.t(),
          first_execution_run_id: String.t()
        }

  defstruct namespace: "",
            workflow_execution: nil,
            reason: "",
            details: nil,
            identity: "",
            first_execution_run_id: ""

  field :namespace, 1, type: :string

  field :workflow_execution, 2,
    type: Temporal.Api.Common.V1.WorkflowExecution,
    json_name: "workflowExecution"

  field :reason, 3, type: :string
  field :details, 4, type: Temporal.Api.Common.V1.Payloads
  field :identity, 5, type: :string
  field :first_execution_run_id, 6, type: :string, json_name: "firstExecutionRunId"
end
defmodule Temporal.Api.Workflowservice.V1.TerminateWorkflowExecutionResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}

  defstruct []
end
defmodule Temporal.Api.Workflowservice.V1.ListOpenWorkflowExecutionsRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          filters:
            {:execution_filter, Temporal.Api.Filter.V1.WorkflowExecutionFilter.t() | nil}
            | {:type_filter, Temporal.Api.Filter.V1.WorkflowTypeFilter.t() | nil},
          namespace: String.t(),
          maximum_page_size: integer,
          next_page_token: binary,
          start_time_filter: Temporal.Api.Filter.V1.StartTimeFilter.t() | nil
        }

  defstruct filters: nil,
            namespace: "",
            maximum_page_size: 0,
            next_page_token: "",
            start_time_filter: nil

  oneof :filters, 0

  field :namespace, 1, type: :string
  field :maximum_page_size, 2, type: :int32, json_name: "maximumPageSize"
  field :next_page_token, 3, type: :bytes, json_name: "nextPageToken"

  field :start_time_filter, 4,
    type: Temporal.Api.Filter.V1.StartTimeFilter,
    json_name: "startTimeFilter"

  field :execution_filter, 5,
    type: Temporal.Api.Filter.V1.WorkflowExecutionFilter,
    json_name: "executionFilter",
    oneof: 0

  field :type_filter, 6,
    type: Temporal.Api.Filter.V1.WorkflowTypeFilter,
    json_name: "typeFilter",
    oneof: 0
end
defmodule Temporal.Api.Workflowservice.V1.ListOpenWorkflowExecutionsResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          executions: [Temporal.Api.Workflow.V1.WorkflowExecutionInfo.t()],
          next_page_token: binary
        }

  defstruct executions: [],
            next_page_token: ""

  field :executions, 1, repeated: true, type: Temporal.Api.Workflow.V1.WorkflowExecutionInfo
  field :next_page_token, 2, type: :bytes, json_name: "nextPageToken"
end
defmodule Temporal.Api.Workflowservice.V1.ListClosedWorkflowExecutionsRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          filters:
            {:execution_filter, Temporal.Api.Filter.V1.WorkflowExecutionFilter.t() | nil}
            | {:type_filter, Temporal.Api.Filter.V1.WorkflowTypeFilter.t() | nil}
            | {:status_filter, Temporal.Api.Filter.V1.StatusFilter.t() | nil},
          namespace: String.t(),
          maximum_page_size: integer,
          next_page_token: binary,
          start_time_filter: Temporal.Api.Filter.V1.StartTimeFilter.t() | nil
        }

  defstruct filters: nil,
            namespace: "",
            maximum_page_size: 0,
            next_page_token: "",
            start_time_filter: nil

  oneof :filters, 0

  field :namespace, 1, type: :string
  field :maximum_page_size, 2, type: :int32, json_name: "maximumPageSize"
  field :next_page_token, 3, type: :bytes, json_name: "nextPageToken"

  field :start_time_filter, 4,
    type: Temporal.Api.Filter.V1.StartTimeFilter,
    json_name: "startTimeFilter"

  field :execution_filter, 5,
    type: Temporal.Api.Filter.V1.WorkflowExecutionFilter,
    json_name: "executionFilter",
    oneof: 0

  field :type_filter, 6,
    type: Temporal.Api.Filter.V1.WorkflowTypeFilter,
    json_name: "typeFilter",
    oneof: 0

  field :status_filter, 7,
    type: Temporal.Api.Filter.V1.StatusFilter,
    json_name: "statusFilter",
    oneof: 0
end
defmodule Temporal.Api.Workflowservice.V1.ListClosedWorkflowExecutionsResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          executions: [Temporal.Api.Workflow.V1.WorkflowExecutionInfo.t()],
          next_page_token: binary
        }

  defstruct executions: [],
            next_page_token: ""

  field :executions, 1, repeated: true, type: Temporal.Api.Workflow.V1.WorkflowExecutionInfo
  field :next_page_token, 2, type: :bytes, json_name: "nextPageToken"
end
defmodule Temporal.Api.Workflowservice.V1.ListWorkflowExecutionsRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          namespace: String.t(),
          page_size: integer,
          next_page_token: binary,
          query: String.t()
        }

  defstruct namespace: "",
            page_size: 0,
            next_page_token: "",
            query: ""

  field :namespace, 1, type: :string
  field :page_size, 2, type: :int32, json_name: "pageSize"
  field :next_page_token, 3, type: :bytes, json_name: "nextPageToken"
  field :query, 4, type: :string
end
defmodule Temporal.Api.Workflowservice.V1.ListWorkflowExecutionsResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          executions: [Temporal.Api.Workflow.V1.WorkflowExecutionInfo.t()],
          next_page_token: binary
        }

  defstruct executions: [],
            next_page_token: ""

  field :executions, 1, repeated: true, type: Temporal.Api.Workflow.V1.WorkflowExecutionInfo
  field :next_page_token, 2, type: :bytes, json_name: "nextPageToken"
end
defmodule Temporal.Api.Workflowservice.V1.ListArchivedWorkflowExecutionsRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          namespace: String.t(),
          page_size: integer,
          next_page_token: binary,
          query: String.t()
        }

  defstruct namespace: "",
            page_size: 0,
            next_page_token: "",
            query: ""

  field :namespace, 1, type: :string
  field :page_size, 2, type: :int32, json_name: "pageSize"
  field :next_page_token, 3, type: :bytes, json_name: "nextPageToken"
  field :query, 4, type: :string
end
defmodule Temporal.Api.Workflowservice.V1.ListArchivedWorkflowExecutionsResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          executions: [Temporal.Api.Workflow.V1.WorkflowExecutionInfo.t()],
          next_page_token: binary
        }

  defstruct executions: [],
            next_page_token: ""

  field :executions, 1, repeated: true, type: Temporal.Api.Workflow.V1.WorkflowExecutionInfo
  field :next_page_token, 2, type: :bytes, json_name: "nextPageToken"
end
defmodule Temporal.Api.Workflowservice.V1.ScanWorkflowExecutionsRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          namespace: String.t(),
          page_size: integer,
          next_page_token: binary,
          query: String.t()
        }

  defstruct namespace: "",
            page_size: 0,
            next_page_token: "",
            query: ""

  field :namespace, 1, type: :string
  field :page_size, 2, type: :int32, json_name: "pageSize"
  field :next_page_token, 3, type: :bytes, json_name: "nextPageToken"
  field :query, 4, type: :string
end
defmodule Temporal.Api.Workflowservice.V1.ScanWorkflowExecutionsResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          executions: [Temporal.Api.Workflow.V1.WorkflowExecutionInfo.t()],
          next_page_token: binary
        }

  defstruct executions: [],
            next_page_token: ""

  field :executions, 1, repeated: true, type: Temporal.Api.Workflow.V1.WorkflowExecutionInfo
  field :next_page_token, 2, type: :bytes, json_name: "nextPageToken"
end
defmodule Temporal.Api.Workflowservice.V1.CountWorkflowExecutionsRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          namespace: String.t(),
          query: String.t()
        }

  defstruct namespace: "",
            query: ""

  field :namespace, 1, type: :string
  field :query, 2, type: :string
end
defmodule Temporal.Api.Workflowservice.V1.CountWorkflowExecutionsResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          count: integer
        }

  defstruct count: 0

  field :count, 1, type: :int64
end
defmodule Temporal.Api.Workflowservice.V1.GetSearchAttributesRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}

  defstruct []
end
defmodule Temporal.Api.Workflowservice.V1.GetSearchAttributesResponse.KeysEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: Temporal.Api.Enums.V1.IndexedValueType.t()
        }

  defstruct key: "",
            value: :INDEXED_VALUE_TYPE_UNSPECIFIED

  field :key, 1, type: :string
  field :value, 2, type: Temporal.Api.Enums.V1.IndexedValueType, enum: true
end
defmodule Temporal.Api.Workflowservice.V1.GetSearchAttributesResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          keys: %{String.t() => Temporal.Api.Enums.V1.IndexedValueType.t()}
        }

  defstruct keys: %{}

  field :keys, 1,
    repeated: true,
    type: Temporal.Api.Workflowservice.V1.GetSearchAttributesResponse.KeysEntry,
    map: true
end
defmodule Temporal.Api.Workflowservice.V1.RespondQueryTaskCompletedRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          task_token: binary,
          completed_type: Temporal.Api.Enums.V1.QueryResultType.t(),
          query_result: Temporal.Api.Common.V1.Payloads.t() | nil,
          error_message: String.t(),
          namespace: String.t()
        }

  defstruct task_token: "",
            completed_type: :QUERY_RESULT_TYPE_UNSPECIFIED,
            query_result: nil,
            error_message: "",
            namespace: ""

  field :task_token, 1, type: :bytes, json_name: "taskToken"

  field :completed_type, 2,
    type: Temporal.Api.Enums.V1.QueryResultType,
    json_name: "completedType",
    enum: true

  field :query_result, 3, type: Temporal.Api.Common.V1.Payloads, json_name: "queryResult"
  field :error_message, 4, type: :string, json_name: "errorMessage"
  field :namespace, 6, type: :string
end
defmodule Temporal.Api.Workflowservice.V1.RespondQueryTaskCompletedResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}

  defstruct []
end
defmodule Temporal.Api.Workflowservice.V1.ResetStickyTaskQueueRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          namespace: String.t(),
          execution: Temporal.Api.Common.V1.WorkflowExecution.t() | nil
        }

  defstruct namespace: "",
            execution: nil

  field :namespace, 1, type: :string
  field :execution, 2, type: Temporal.Api.Common.V1.WorkflowExecution
end
defmodule Temporal.Api.Workflowservice.V1.ResetStickyTaskQueueResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}

  defstruct []
end
defmodule Temporal.Api.Workflowservice.V1.QueryWorkflowRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          namespace: String.t(),
          execution: Temporal.Api.Common.V1.WorkflowExecution.t() | nil,
          query: Temporal.Api.Query.V1.WorkflowQuery.t() | nil,
          query_reject_condition: Temporal.Api.Enums.V1.QueryRejectCondition.t()
        }

  defstruct namespace: "",
            execution: nil,
            query: nil,
            query_reject_condition: :QUERY_REJECT_CONDITION_UNSPECIFIED

  field :namespace, 1, type: :string
  field :execution, 2, type: Temporal.Api.Common.V1.WorkflowExecution
  field :query, 3, type: Temporal.Api.Query.V1.WorkflowQuery

  field :query_reject_condition, 4,
    type: Temporal.Api.Enums.V1.QueryRejectCondition,
    json_name: "queryRejectCondition",
    enum: true
end
defmodule Temporal.Api.Workflowservice.V1.QueryWorkflowResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          query_result: Temporal.Api.Common.V1.Payloads.t() | nil,
          query_rejected: Temporal.Api.Query.V1.QueryRejected.t() | nil
        }

  defstruct query_result: nil,
            query_rejected: nil

  field :query_result, 1, type: Temporal.Api.Common.V1.Payloads, json_name: "queryResult"
  field :query_rejected, 2, type: Temporal.Api.Query.V1.QueryRejected, json_name: "queryRejected"
end
defmodule Temporal.Api.Workflowservice.V1.DescribeWorkflowExecutionRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          namespace: String.t(),
          execution: Temporal.Api.Common.V1.WorkflowExecution.t() | nil
        }

  defstruct namespace: "",
            execution: nil

  field :namespace, 1, type: :string
  field :execution, 2, type: Temporal.Api.Common.V1.WorkflowExecution
end
defmodule Temporal.Api.Workflowservice.V1.DescribeWorkflowExecutionResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          execution_config: Temporal.Api.Workflow.V1.WorkflowExecutionConfig.t() | nil,
          workflow_execution_info: Temporal.Api.Workflow.V1.WorkflowExecutionInfo.t() | nil,
          pending_activities: [Temporal.Api.Workflow.V1.PendingActivityInfo.t()],
          pending_children: [Temporal.Api.Workflow.V1.PendingChildExecutionInfo.t()]
        }

  defstruct execution_config: nil,
            workflow_execution_info: nil,
            pending_activities: [],
            pending_children: []

  field :execution_config, 1,
    type: Temporal.Api.Workflow.V1.WorkflowExecutionConfig,
    json_name: "executionConfig"

  field :workflow_execution_info, 2,
    type: Temporal.Api.Workflow.V1.WorkflowExecutionInfo,
    json_name: "workflowExecutionInfo"

  field :pending_activities, 3,
    repeated: true,
    type: Temporal.Api.Workflow.V1.PendingActivityInfo,
    json_name: "pendingActivities"

  field :pending_children, 4,
    repeated: true,
    type: Temporal.Api.Workflow.V1.PendingChildExecutionInfo,
    json_name: "pendingChildren"
end
defmodule Temporal.Api.Workflowservice.V1.DescribeTaskQueueRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          namespace: String.t(),
          task_queue: Temporal.Api.Taskqueue.V1.TaskQueue.t() | nil,
          task_queue_type: Temporal.Api.Enums.V1.TaskQueueType.t(),
          include_task_queue_status: boolean
        }

  defstruct namespace: "",
            task_queue: nil,
            task_queue_type: :TASK_QUEUE_TYPE_UNSPECIFIED,
            include_task_queue_status: false

  field :namespace, 1, type: :string
  field :task_queue, 2, type: Temporal.Api.Taskqueue.V1.TaskQueue, json_name: "taskQueue"

  field :task_queue_type, 3,
    type: Temporal.Api.Enums.V1.TaskQueueType,
    json_name: "taskQueueType",
    enum: true

  field :include_task_queue_status, 4, type: :bool, json_name: "includeTaskQueueStatus"
end
defmodule Temporal.Api.Workflowservice.V1.DescribeTaskQueueResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          pollers: [Temporal.Api.Taskqueue.V1.PollerInfo.t()],
          task_queue_status: Temporal.Api.Taskqueue.V1.TaskQueueStatus.t() | nil
        }

  defstruct pollers: [],
            task_queue_status: nil

  field :pollers, 1, repeated: true, type: Temporal.Api.Taskqueue.V1.PollerInfo

  field :task_queue_status, 2,
    type: Temporal.Api.Taskqueue.V1.TaskQueueStatus,
    json_name: "taskQueueStatus"
end
defmodule Temporal.Api.Workflowservice.V1.GetClusterInfoRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}

  defstruct []
end
defmodule Temporal.Api.Workflowservice.V1.GetClusterInfoResponse.SupportedClientsEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: String.t()
        }

  defstruct key: "",
            value: ""

  field :key, 1, type: :string
  field :value, 2, type: :string
end
defmodule Temporal.Api.Workflowservice.V1.GetClusterInfoResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          supported_clients: %{String.t() => String.t()},
          server_version: String.t(),
          cluster_id: String.t(),
          version_info: Temporal.Api.Version.V1.VersionInfo.t() | nil,
          cluster_name: String.t(),
          history_shard_count: integer,
          persistence_store: String.t(),
          visibility_store: String.t()
        }

  defstruct supported_clients: %{},
            server_version: "",
            cluster_id: "",
            version_info: nil,
            cluster_name: "",
            history_shard_count: 0,
            persistence_store: "",
            visibility_store: ""

  field :supported_clients, 1,
    repeated: true,
    type: Temporal.Api.Workflowservice.V1.GetClusterInfoResponse.SupportedClientsEntry,
    json_name: "supportedClients",
    map: true

  field :server_version, 2, type: :string, json_name: "serverVersion"
  field :cluster_id, 3, type: :string, json_name: "clusterId"
  field :version_info, 4, type: Temporal.Api.Version.V1.VersionInfo, json_name: "versionInfo"
  field :cluster_name, 5, type: :string, json_name: "clusterName"
  field :history_shard_count, 6, type: :int32, json_name: "historyShardCount"
  field :persistence_store, 7, type: :string, json_name: "persistenceStore"
  field :visibility_store, 8, type: :string, json_name: "visibilityStore"
end
defmodule Temporal.Api.Workflowservice.V1.ListTaskQueuePartitionsRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          namespace: String.t(),
          task_queue: Temporal.Api.Taskqueue.V1.TaskQueue.t() | nil
        }

  defstruct namespace: "",
            task_queue: nil

  field :namespace, 1, type: :string
  field :task_queue, 2, type: Temporal.Api.Taskqueue.V1.TaskQueue, json_name: "taskQueue"
end
defmodule Temporal.Api.Workflowservice.V1.ListTaskQueuePartitionsResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          activity_task_queue_partitions: [
            Temporal.Api.Taskqueue.V1.TaskQueuePartitionMetadata.t()
          ],
          workflow_task_queue_partitions: [
            Temporal.Api.Taskqueue.V1.TaskQueuePartitionMetadata.t()
          ]
        }

  defstruct activity_task_queue_partitions: [],
            workflow_task_queue_partitions: []

  field :activity_task_queue_partitions, 1,
    repeated: true,
    type: Temporal.Api.Taskqueue.V1.TaskQueuePartitionMetadata,
    json_name: "activityTaskQueuePartitions"

  field :workflow_task_queue_partitions, 2,
    repeated: true,
    type: Temporal.Api.Taskqueue.V1.TaskQueuePartitionMetadata,
    json_name: "workflowTaskQueuePartitions"
end

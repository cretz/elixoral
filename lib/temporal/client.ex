defmodule Temporal.Client do
  require Logger

  @enforce_keys [:channel]
  defstruct [:channel]

  def connect(opts) do
    with {:ok, channel} <- GRPC.Stub.connect(opts.addr, opts.grpc_opts) do
      {:ok, %Temporal.Client{channel: channel}}
    end
  end

  def disconnect(client) do
    with {:ok, _} <- client.channel |> GRPC.Stub.disconnect() do
      {:ok, client}
    end
  end

  def start_workflow(%Temporal.Client{} = client, %Temporal.Client.StartWorkflowOptions{} = opts) do
    # with {:ok, workflow_type} <- workflow_type(opts.workflow),
    #      {:ok, resp} <- client.channel |> Temporal.Api.Workflowservice.V1.WorkflowService.Stub.start_workflow_execution(
    #         Temporal.Api.Workflowservice.V1.StartWorkflowExecutionRequest.new!(
    #           namespace: opts.namespace,
    #           workflow_id: opts.workflow_id,
    #           workflow_type: Temporal.Api.Common.V1.WorkflowType.new!(name: workflow_type),
    #           task_queue: Temporal.Api.Taskqueue.V1.TaskQueue.new!(name: opts.task_queue),
    #           request_id: UUID.uuid4()
    #         )
    #      ),
    #      do

    #      end
    # workflow_type = case workflow_type()

    # req = Temporal.Api.Workflowservice.V1.StartWorkflowExecutionRequest.new!(
    #   namespace: opts.namespace,
    #   workflow_id: opts.workflow_id,
    #   workflow_type: Temporal.Api.Common.V1.WorkflowType.new!(name: "MyWorkflow"),
    #   task_queue: Temporal.Api.Taskqueue.V1.TaskQueue.new!(name: opts.task_queue),
    #   request_id: UUID.uuid4()
    # )
    # # with {:ok, resp} <-
    # Logger.info("WUT #{inspect(opts.workflow)}")
    # # raise "OH NO '#{workflow_type(opts.workflow)}'"
  end

  defp workflow_type(v) when is_atom(v), do: Atom.to_string(v)
  defp workflow_type(v) when is_binary(v), do: v

  defp workflow_type(v) when is_function(v) do
    case Function.info(v, :module) do
      {:module, :erl_eval} ->
        {:error, "cannot use anonymous functions for workflows"}
      {:module, module} ->
        {:ok, module}
    end
  end

end

defmodule Temporal.Examples.HelloWorldRaw do
  require Logger

  def run() do
    {:ok, client} = Temporal.Client.connect("localhost:7233")

    task_queue = "my-queue-#{UUID.uuid4()}"
    Logger.info("Starting worker on task queue #{task_queue}")

    {:ok, worker_pid} =
      Temporal.Worker.start(%Temporal.Worker.Options{
        client: client,
        task_queue: task_queue,
        workflows: [&WorkflowRaw.run/1]
      })

    workflow_id = "my-workflow-#{UUID.uuid4()}"
    Logger.info("Starting workflow #{workflow_id} on task queue #{task_queue}")

    {:ok, execution} =
      Temporal.Client.start_workflow(%Temporal.Client.StartWorkflowOptions{
        client: client,
        task_queue: task_queue,
        workflow: &WorkflowRaw.run/1,
        args: ["Hello"],
        workflow_id: workflow_id
      })

    Logger.info("Workflow run ID: #{execution.run_id}")

    {:ok, res} = Temporal.Client.WorkflowExecution.await(execution)
    Logger.info("Workflow completed successfully, result: #{res}")
  end

  defmodule WorklowRaw do
    require Logger

    def run(worker_pid) do
      receive do
        {:ok, act} ->
          case handle_jobs(act.jobs) do
            {:ok, cmds} ->
              # TODO: Send commands
              run(worker_pid)

            {:error, failure_info} ->
              # TODO: Send failures
              {:error, failure_info}
          end

        err ->
          err
      end
    end

    defp handle_jobs([job | tail], cmds \\ []) do
      Logger.debug("Handling job #{inspect(job)}")

      res =
        case job.variant do
          {:start_workflow, v} -> start_workflow(v)
          {:remove_from_cache, v} -> remove_from_cache(v)
        end

      with {:ok, new_cmds} <- res, do: handle_jobs(tail, cmds ++ new_cmds)
    end

    def handle_jobs([], cmds \\ []), do: {:ok, cmds}

    defp start_workflow(v) do
      # Get param
      arg = with [payload] <- v.arguments, do: Temporal.Converter.Default.decode(payload)

      # Concat
      res = arg <> ", World!"

      # Send back command
      {:ok,
       [
         {:complete_workflow_execution,
          %Temporal.Coresdk.WorkflowCommands.CompleteWorkflowExecution{
            result: Temporal.Converter.Default.encode(res)
          }}
       ]}
    end

    defp remove_from_cache(v), do: {:ok, []}
  end
end

use rustler::Encoder;

#[rustler::nif]
fn some_name() -> String {
    "From Rust!".to_string()
}

pub struct Runtime(std::sync::Arc<tokio::runtime::Runtime>);

#[rustler::nif]
pub fn runtime_new() -> rustler::ResourceArc<Runtime> {
    rustler::ResourceArc::new(Runtime(std::sync::Arc::new(
        tokio::runtime::Builder::new_multi_thread()
            .enable_all()
            .build()
            .unwrap(),
    )))
}

#[derive(Debug, rustler::NifStruct)]
#[module = "Elixir.Temporal.Core.Native.CoreInitOptions"]
pub struct CoreInitOptions {
    pub target_url: String,
    pub namespace: String,
    pub client_name: String,
    pub client_version: String,
    pub identity: String,
    pub worker_binary_id: String,
    // TODO(cretz): More options
}

impl TryFrom<CoreInitOptions> for temporal_sdk_core::CoreInitOptions {
    type Error = String;

    fn try_from(opts: CoreInitOptions) -> Result<Self, Self::Error> {
        temporal_sdk_core::CoreInitOptionsBuilder::default()
            .gateway_opts(
                temporal_sdk_core::ServerGatewayOptionsBuilder::default()
                    .target_url(
                        temporal_sdk_core::Url::parse(&opts.target_url)
                            .map_err(|err| format!("invalid target URL: {}", err))?,
                    )
                    .namespace(opts.namespace)
                    .client_name(opts.client_name)
                    .client_version(opts.client_version)
                    .identity(opts.identity)
                    .worker_binary_id(opts.worker_binary_id)
                    .build()
                    .map_err(|err| format!("invalid gateway options: {}", err))?,
            )
            .build()
            .map_err(|err| format!("invalid options: {}", err))
    }
}

#[derive(Debug, rustler::NifStruct)]
#[module = "Elixir.Temporal.Core.Native.WorkerConfig"]
pub struct WorkerConfig {
    pub task_queue: String,
    // TODO(cretz): More options
}

impl TryFrom<WorkerConfig> for temporal_sdk_core_api::worker::WorkerConfig {
    type Error = String;

    fn try_from(config: WorkerConfig) -> Result<Self, Self::Error> {
        temporal_sdk_core_api::worker::WorkerConfigBuilder::default()
            .task_queue(config.task_queue)
            .build()
            .map_err(|err| format!("invalid config: {}", err))
    }
}

struct Message {
    pid: rustler::LocalPid,
    req_id: u64,
    form: MessageForm,
}

enum MessageForm {
    RegisterWorker(temporal_sdk_core_api::worker::WorkerConfig),
    PollWorkflowActivation { task_queue: String },
    PollActivityTask{ task_queue: String },
    CompleteWorkflowActivation(
        temporal_sdk_core_protos::coresdk::workflow_completion::WorkflowActivationCompletion,
    ),
    CompleteActivityTask(temporal_sdk_core_protos::coresdk::ActivityTaskCompletion),
    RecordActivityHeartbeat(temporal_sdk_core_protos::coresdk::ActivityHeartbeat),
    RequestWorkflowEviction { task_queue: String, run_id: String },

    ResponseOk,
    ResponseOkBinary(rustler::OwnedBinary),
    ResponseErrString(String),
    ResponseErrAtom(rustler::Atom),
}

#[rustler::nif]
pub fn core_start(
    env: rustler::Env,
    runtime: rustler::ResourceArc<Runtime>,
    req_id: u64,
    opts: CoreInitOptions,
) -> rustler::NifResult<rustler::ResourceArc<CoreRuntime>> {
    let opts = opts
        .try_into()
        .map_err(|err| rustler::Error::Term(Box::new(err)))?;
    Ok(rustler::ResourceArc::new(CoreRuntime::start(
        runtime.0.clone(),
        opts,
        env.pid(),
        req_id,
    )))
}

#[rustler::nif]
pub fn register_worker(
    env: rustler::Env,
    runtime: rustler::ResourceArc<CoreRuntime>,
    req_id: u64,
    config: WorkerConfig,
) -> rustler::NifResult<()> {
    let config = config
        .try_into()
        .map_err(|err| rustler::Error::Term(Box::new(err)))?;
    runtime.send_message_sync(Message {
        pid: env.pid(),
        req_id,
        form: MessageForm::RegisterWorker(config),
    });
    Ok(())
}

#[rustler::nif]
pub fn poll_workflow_activation(
    env: rustler::Env,
    runtime: rustler::ResourceArc<CoreRuntime>,
    req_id: u64,
    task_queue: String,
) -> rustler::NifResult<()> {
    runtime.send_message_sync(Message {
        pid: env.pid(),
        req_id,
        form: MessageForm::PollWorkflowActivation { task_queue },
    });
    Ok(())
}

#[rustler::nif]
pub fn poll_activity_task(
    env: rustler::Env,
    runtime: rustler::ResourceArc<CoreRuntime>,
    req_id: u64,
    task_queue: String,
) -> rustler::NifResult<()> {
    runtime.send_message_sync(Message {
        pid: env.pid(),
        req_id,
        form: MessageForm::PollActivityTask { task_queue },
    });
    Ok(())
}

#[rustler::nif]
pub fn complete_workflow_activation(
    env: rustler::Env,
    runtime: rustler::ResourceArc<CoreRuntime>,
    req_id: u64,
    proto: rustler::Binary,
) -> rustler::NifResult<()> {
    let v = decode_proto::<
        temporal_sdk_core_protos::coresdk::workflow_completion::WorkflowActivationCompletion,
    >(proto)
    .map_err(|err| rustler::Error::Term(Box::new(format!("{}", err))))?;
    runtime.send_message_sync(Message {
        pid: env.pid(),
        req_id,
        form: MessageForm::CompleteWorkflowActivation(v),
    });
    Ok(())
}

#[rustler::nif]
pub fn complete_activity_task(
    env: rustler::Env,
    runtime: rustler::ResourceArc<CoreRuntime>,
    req_id: u64,
    proto: rustler::Binary,
) -> rustler::NifResult<()> {
    let v = decode_proto::<temporal_sdk_core_protos::coresdk::ActivityTaskCompletion>(proto)
        .map_err(|err| rustler::Error::Term(Box::new(format!("{}", err))))?;
    runtime.send_message_sync(Message {
        pid: env.pid(),
        req_id,
        form: MessageForm::CompleteActivityTask(v),
    });
    Ok(())
}

#[rustler::nif]
pub fn record_activity_heartbeat(
    env: rustler::Env,
    runtime: rustler::ResourceArc<CoreRuntime>,
    req_id: u64,
    proto: rustler::Binary,
) -> rustler::NifResult<()> {
    let v = decode_proto::<temporal_sdk_core_protos::coresdk::ActivityHeartbeat>(proto)
        .map_err(|err| rustler::Error::Term(Box::new(format!("{}", err))))?;
    runtime.send_message_sync(Message {
        pid: env.pid(),
        req_id,
        form: MessageForm::RecordActivityHeartbeat(v),
    });
    Ok(())
}

#[rustler::nif]
pub fn request_workflow_eviction(
    env: rustler::Env,
    runtime: rustler::ResourceArc<CoreRuntime>,
    req_id: u64,
    task_queue: String,
    run_id: String,
) -> rustler::NifResult<()> {
    runtime.send_message_sync(Message {
        pid: env.pid(),
        req_id,
        form: MessageForm::RequestWorkflowEviction { task_queue, run_id },
    });
    Ok(())
}

#[derive(Clone)]
pub struct CoreRuntime {
    runtime: std::sync::Arc<tokio::runtime::Runtime>,
    tx: tokio::sync::mpsc::Sender<Message>,
}

impl CoreRuntime {
    fn start(
        runtime: std::sync::Arc<tokio::runtime::Runtime>,
        opts: temporal_sdk_core::CoreInitOptions,
        start_pid: rustler::LocalPid,
        start_req_id: u64,
    ) -> CoreRuntime {
        // TODO(cretz): Configure buffer
        let (tx, rx) = tokio::sync::mpsc::channel::<Message>(500);
        let core = CoreRuntime {
            runtime: runtime.clone(),
            tx: tx,
        };
        let core_run = core.clone();
        runtime
            .clone()
            .spawn(async move { core_run.run(rx, opts, start_pid, start_req_id).await });
        core
    }

    fn send_message_sync(&self, req: Message) {
        let core_runtime = self.clone();
        self.runtime.spawn(async move {
            core_runtime.send_message(req).await;
        });
    }

    async fn send_message(&self, req: Message) {
        // Just warn on error
        if let Err(_) = self.tx.send(req).await {
            log::warn!("send failed");
        }
    }

    async fn run(
        &self,
        mut rx: tokio::sync::mpsc::Receiver<Message>,
        opts: temporal_sdk_core::CoreInitOptions,
        start_pid: rustler::LocalPid,
        start_req_id: u64,
    ) {
        let mut env = rustler::OwnedEnv::new();

        let core_instance = CoreInstance {
            runtime: self.clone(),
            core: match temporal_sdk_core::init(opts).await {
                Ok(core) => {
                    send_env_ok(&mut env, &start_pid, start_req_id, ());
                    std::sync::Arc::new(core)
                }
                Err(err) => {
                    send_env_err(&mut env, &start_pid, start_req_id, format!("{}", err));
                    return;
                }
            },
        };

        loop {
            let Message { pid, req_id, form } = match rx.recv().await {
                Some(msg) => msg,
                None => return,
            };
            match form {
                MessageForm::RegisterWorker(config) => {
                    let core_instance = core_instance.clone();
                    self.runtime.spawn(async move {
                        core_instance.register_worker(pid, req_id, config).await;
                    });
                }

                MessageForm::PollWorkflowActivation { task_queue } => {
                    let core_instance = core_instance.clone();
                    self.runtime.spawn(async move {
                        core_instance
                            .poll_workflow_activation(pid, req_id, task_queue)
                            .await;
                    });
                }

                MessageForm::PollActivityTask { task_queue } => {
                    let core_instance = core_instance.clone();
                    self.runtime.spawn(async move {
                        core_instance
                            .poll_activity_task(pid, req_id, task_queue)
                            .await;
                    });
                }

                MessageForm::CompleteWorkflowActivation(v) => {
                    let core_instance = core_instance.clone();
                    self.runtime.spawn(async move {
                        core_instance
                            .complete_workflow_activation(pid, req_id, v)
                            .await;
                    });
                }

                MessageForm::CompleteActivityTask(v) => {
                    let core_instance = core_instance.clone();
                    self.runtime.spawn(async move {
                        core_instance.complete_activity_task(pid, req_id, v).await;
                    });
                }

                MessageForm::RecordActivityHeartbeat(v) => {
                    let core_instance = core_instance.clone();
                    self.runtime.spawn(async move {
                        core_instance.record_activity_heartbeat(pid, req_id, v).await;
                    });
                }

                MessageForm::RequestWorkflowEviction { task_queue, run_id } => {
                    let core_instance = core_instance.clone();
                    self.runtime.spawn(async move {
                        core_instance.request_workflow_eviction(pid, req_id, task_queue, run_id).await;
                    });
                }

                MessageForm::ResponseOk => {
                    send_env_ok(&mut env, &pid, req_id, ());
                }

                MessageForm::ResponseOkBinary(binary) => {
                    send_env_ok_binary(&mut env, &pid, req_id, binary);
                }

                MessageForm::ResponseErrString(err) => {
                    send_env_err(&mut env, &pid, req_id, err);
                }

                MessageForm::ResponseErrAtom(err) => {
                    send_env_err(&mut env, &pid, req_id, err);
                }
            };
        }
    }
}

#[derive(Clone)]
struct CoreInstance {
    runtime: CoreRuntime,
    core: std::sync::Arc<dyn temporal_sdk_core_api::Core>,
}

impl CoreInstance {
    async fn register_worker(
        &self,
        pid: rustler::LocalPid,
        req_id: u64,
        config: temporal_sdk_core_api::worker::WorkerConfig,
    ) {
        let form = match self.core.register_worker(config).await {
            Ok(()) => MessageForm::ResponseOk,
            Err(temporal_sdk_core_api::errors::WorkerRegistrationError::WorkerAlreadyRegisteredForQueue(_)) =>
                MessageForm::ResponseErrAtom(core_atoms::worker_already_registered()),
        };
        self.runtime
            .send_message(Message { pid, req_id, form })
            .await;
    }

    async fn poll_workflow_activation(
        &self,
        pid: rustler::LocalPid,
        req_id: u64,
        task_queue: String,
    ) {
        let form = match self.core.poll_workflow_activation(&task_queue).await {
            Ok(v) => MessageForm::ResponseOkBinary(encode_proto(&v)),
            Err(err) => MessageForm::ResponseErrString(format!("{}", err)),
        };
        self.runtime
            .send_message(Message { pid, req_id, form })
            .await;
    }

    async fn poll_activity_task(&self, pid: rustler::LocalPid, req_id: u64, task_queue: String) {
        let form = match self.core.poll_activity_task(&task_queue).await {
            Ok(v) => MessageForm::ResponseOkBinary(encode_proto(&v)),
            Err(err) => MessageForm::ResponseErrString(format!("{}", err)),
        };
        self.runtime
            .send_message(Message { pid, req_id, form })
            .await;
    }

    async fn complete_workflow_activation(
        &self,
        pid: rustler::LocalPid,
        req_id: u64,
        v: temporal_sdk_core_protos::coresdk::workflow_completion::WorkflowActivationCompletion,
    ) {
        let form = match self.core.complete_workflow_activation(v).await {
            Ok(()) => MessageForm::ResponseOk,
            Err(err) => MessageForm::ResponseErrString(format!("{}", err)),
        };
        self.runtime
            .send_message(Message { pid, req_id, form })
            .await;
    }

    async fn complete_activity_task(
        &self,
        pid: rustler::LocalPid,
        req_id: u64,
        v: temporal_sdk_core_protos::coresdk::ActivityTaskCompletion,
    ) {
        let form = match self.core.complete_activity_task(v).await {
            Ok(()) => MessageForm::ResponseOk,
            Err(err) => MessageForm::ResponseErrString(format!("{}", err)),
        };
        self.runtime
            .send_message(Message { pid, req_id, form })
            .await;
    }

    async fn record_activity_heartbeat(
        &self,
        pid: rustler::LocalPid,
        req_id: u64,
        v: temporal_sdk_core_protos::coresdk::ActivityHeartbeat,
    ) {
        self.core.record_activity_heartbeat(v);
        self.runtime
            .send_message(Message { pid, req_id, form: MessageForm::ResponseOk })
            .await;
    }

    async fn request_workflow_eviction(
        &self,
        pid: rustler::LocalPid,
        req_id: u64,
        task_queue: String,
        run_id: String,
    ) {
        self.core.request_workflow_eviction(&task_queue, &run_id);
        self.runtime
            .send_message(Message { pid, req_id, form: MessageForm::ResponseOk })
            .await;
    }
}

fn send_env_ok<T>(env: &mut rustler::OwnedEnv, pid: &rustler::LocalPid, req_id: u64, res: T)
where
    T: rustler::Encoder,
{
    env.send_and_clear(pid, move |env| {
        (rustler::types::atom::ok(), req_id, res).encode(env)
    });
}

fn send_env_ok_binary(
    env: &mut rustler::OwnedEnv,
    pid: &rustler::LocalPid,
    req_id: u64,
    res: rustler::OwnedBinary,
) {
    env.send_and_clear(pid, move |env| {
        let res = res.release(env);
        (rustler::types::atom::ok(), req_id, res).encode(env)
    });
}

fn send_env_err<E>(env: &mut rustler::OwnedEnv, pid: &rustler::LocalPid, req_id: u64, res: E)
where
    E: rustler::Encoder,
{
    env.send_and_clear(pid, move |env| {
        (rustler::types::atom::error(), req_id, res).encode(env)
    });
}

// Panics on fail
fn encode_proto(proto: &impl prost::Message) -> rustler::OwnedBinary {
    let mut bin = rustler::OwnedBinary::new(proto.encoded_len()).expect("alloc failed");
    proto.encode(&mut bin.as_mut_slice()).unwrap();
    bin
}

fn decode_proto<P>(bin: rustler::Binary) -> Result<P, String>
where
    P: prost::Message,
    P: Default,
{
    P::decode(bin.as_slice()).map_err(|err| format!("failed decoding proto: {}", err))
}

rustler::init!(
    "Elixir.Temporal.Core.Native",
    [some_name, runtime_new,],
    load = load
);

fn load(env: rustler::Env, _: rustler::Term) -> bool {
    rustler::resource!(Runtime, env);
    rustler::resource!(CoreRuntime, env);
    true
}

mod core_atoms {
    rustler::atoms! {
        worker_already_registered,
    }
}

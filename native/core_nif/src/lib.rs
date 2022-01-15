#[rustler::nif]
fn some_name() -> String {
    "From Rust!".to_string()
}

rustler::init!("Elixir.Temporal.Core.Native", [some_name]);

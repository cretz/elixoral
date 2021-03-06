defmodule Elixoral.MixProject do
  use Mix.Project

  def project do
    [
      app: :elixoral,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:cowlib, "~> 2.9.0", override: true},
      {:jason, "~> 1.3"},
      {:google_protos, "~> 0.2.0"},
      # {:grpc, "~> 0.3.1"},
      {:grpc, github: "elixir-grpc/grpc"},
      {:protobuf, "~> 0.9.0"},
      {:rustler, "~> 0.23.0"},
      {:elixir_uuid, "~> 1.2"}
    ]
  end
end

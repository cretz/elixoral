defmodule Elixoral.MixProject do
  use Mix.Project

  def project do
    [
      app: :elixoral,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      rustler_crates: rustler_crates()
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
      {:rustler, "~> 0.23.0"}
    ]
  end

  defp rustler_crates do
    [
      core_nif: [
        path: "native/core_nif"
      ]
    ]
  end
end

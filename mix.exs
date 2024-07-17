defmodule FlexSite.MixProject do
  use Mix.Project

  @env Application.compile_env(:flex_web, :env)

  def project do
    [
      app: :flex_site,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: @env == :prod,
      deps: deps(),
      releases: releases()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {FlexSite.Application, []}
    ]
  end

  defp deps do
    [
      {:flex_web, "~> 0.1.0"},
      {:jason, "~> 1.2"},
      {:file_system, "~> 0.2"},
    ]
  end

  defp releases do
    [
      flex_site: [
        include_executables_for: [:unix],
        applications: [runtime_tools: :permanent],
        steps: [:assemble, :tar]
      ]
    ]
  end
end

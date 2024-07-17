defmodule FlexSite.MixProject do
  use Mix.Project

  def project do
    [
      app: :flex_site,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps()
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
end

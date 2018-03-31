defmodule NovaNodeClient.MixProject do
  use Mix.Project

  def project do
    [
      app: :nova_node_client,
      version: "0.1.1",
      elixir: "~> 1.6",
      deps: deps()
    ]
  end

  def application do
    [applications: [:httpoison]]
  end

  defp deps do
    [
      {:httpoison, "~> 1.0"},
      {:poison, "~> 3.1"}
    ]
  end

  defp package do
    [
      maintainers: ["Insprac"],
      links: %{"Github" => "https://github.com/insprac/nova_node_client.git"}
    ]
  end
end

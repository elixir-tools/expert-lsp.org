defmodule ExpertLspOrg.MixProject do
  use Mix.Project

  def project do
    [
      app: :expert_lsp_org,
      version: "0.1.0",
      # netlify has 1.17
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      compilers: [:temple] ++ Mix.compilers(),
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  def aliases() do
    [
      build: ["tableau.build", "tailwind default --minify"]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:tableau, "~> 0.17"},
      {:tailwind, "~> 0.3", runtime: Mix.env() == :dev},
      {:temple, "~> 0.12"}

      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end

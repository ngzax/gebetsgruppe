defmodule Gebetsgruppe.Mixfile do
  use Mix.Project

  def project do
    [app: :gebetsgruppe,
     version: "0.0.1",
     elixir: "~> 1.0",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     aliases: aliases,
     deps: deps]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Gebetsgruppe, []},
      applications: applications(Mix.env)
    ]
  end

  def applications(env) when env in [:test] do
    applications(:default) ++ [:ex_machina]
  end
  
  def applications(_) do
    [
      :phoenix,
      :phoenix_ecto,
      :phoenix_html,
      :comeonin,
      :cowboy,
      :logger,
      :postgrex
    ]
  end
    
  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix,             "~> 1.1"},
      {:phoenix_ecto,        "~> 1.1"},
      {:postgrex,            "~> 0.11.0"},
      {:phoenix_html,        "~> 2.1"},
      {:phoenix_live_reload, "~> 1.0",   only: :dev},
      
      {:comeonin,            "~> 2.1.0"},
      {:cowboy,              "~> 1.0"},
      {:ex_machina,          "~>0.6",    only: [:dev, :test]},
      {:ex_spec,             "~> 1.0.0", only: :test},
      {:guardian,            "0.10.0",   override: true},
      {:guardian_db,         "0.4.0",    path: "/Users/daryl/Code/guardian_db", override: true},
      {:hound,               "~> 0.8",   only: :test},
      {:mailman,             "~> 0.2.1"},
      {:mix_test_watch,      "~> 0.2",   only: [:dev, :test]},
      {:sentinel,            "0.0.4"},
      {:uuid,                "~> 1.1"}
    ]
  end

  # Aliases are shortcut or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop",   "ecto.setup"],
      "test":       [&setup_db/1,   "test"]
    ]
  end

  defp setup_db(_) do
    unless List.keyfind(Application.loaded_applications(), project[:app], 0) do
      # Create the database, run migrations
      Mix.Task.run "ecto.drop",    ["--quiet"]
      Mix.Task.run "ecto.create",  ["--quiet"]
      Mix.Task.run "ecto.migrate", ["--quiet"]
    end
  end
  
end

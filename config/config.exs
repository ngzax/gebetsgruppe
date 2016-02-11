# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :gebetsgruppe, Gebetsgruppe.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "b1bN5PSr6Sm7JAccFCXSAwXUaFOeL/KI7dXk+R+s+NvNLYUMBFv9u6NpoDaXBdfw",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: Gebetsgruppe.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :guardian, Guardian,
  allowed_algos: ["HS512"],      # optional
  verify_module: Guardian.JWT,   # optional
  issuer:        "Gebetsgruppe",
  ttl:           {30, :days},
  verify_issuer: false,          # optional
  secret_key:    "LetUsPray",
  serializer:    Gebetsgruppe.GuardianSerializer
 
# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

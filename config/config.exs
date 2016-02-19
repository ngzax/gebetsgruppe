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

# Addict is for User Login/Authorization
config :addict, 
  not_logged_in_url: "/error",  # the URL where users will be redirected to
  db: Gebetsgruppe.MyRepo,
  user: Gebetsgruppe.MyUser,
  register_from_email: "Registration <welcome@yourawesomeapp.com>", # email registered users will receive from address
  register_subject: "Welcome to yourawesomeapp!",                   # email registered users will receive subject
  password_recover_from_email: "Password Recovery <no-reply@yourawesomeapp.com>",
  password_recover_subject: "You requested a password recovery link",
  email_templates: Gebetsgruppe.MyEmailTemplates                    # email templates for sending e-mails, more on this further down
  
# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :mix_test_watch,
  tasks: [
    "test"
  ]

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

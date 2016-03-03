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
  hooks:         GuardianDb,
  issuer:        "Gebetsgruppe",
  secret_key:    "LetUsPray",
  serializer:    Gebetsgruppe.GuardianSerializer,
  ttl:           {10, :days},
  verify_issuer: false,          # optional
  verify_module: Guardian.JWT   # optional
 
config :guardian_db, GuardianDb,
  repo: Gebetsgruppe.Repo
    
# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Local server example
config :mailman,
  port: 1234

# Mailgun Example
# config :mailman,
#   port: 587,
#   address: "smtp.mailgun.org",
#   user_name: System.get_env("MAILGUN_USERNAME"),
#   password: System.get_env("MAILGUN_PASSWORD")
    
config :mix_test_watch,
  tasks: [
    "test"
  ]

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false

# Sentinel is a "Phoenix Authentication library that wraps Guardian for extra functionality"
# config :sentinel,
#   app_name:        "Gebetsgruppe",
#   auth_handler:    Sentinel.AuthHandler,  # optional
#   confirmable:     :false,                # possible options {:false, :required, :optional}, optional config
#   crypto_provider: Comeonin.Bcrypt,
#   email_sender:    "netz_meister@gebetsgruppe.com",
#   endpoint:        Gebetsgruppe.Endpoint,
#   repo:            Gebetsgruppe.Repo,
#   router:          Gebetsgruppe.Router,
#   user_model:      Gebetsgruppe.User

config :ueberauth, Ueberauth,
  providers: [
    github:   {Ueberauth.Strategy.Github,   [uid_field: "login"]},
    slack:    {Ueberauth.Strategy.Slack,    [default_scope: "users:read,identify"]},
    identity: {Ueberauth.Strategy.Identity, [callback_methods: ["POST"]]},
  ]
  
config :ueberauth, Ueberauth.Strategy.Github.OAuth,
  client_id: System.get_env("GITHUB_CLIENT_ID"),
  client_secret: System.get_env("GITHUB_CLIENT_SECRET")
  
config :ueberauth, Ueberauth.Strategy.Slack.OAuth,
  client_id: System.get_env("SLACK_CLIENT_ID"),
  client_secret: System.get_env("SLACK_CLIENT_SECRET")
  
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :gebetsgruppe, Gebetsgruppe.Endpoint,
  http: [port: 4001],
  server: true

# Print only warnings and errors during test
config :logger, level: :warn

config :mix_test_watch,
  tasks: [
    "test"
  ]

# Configure your database
config :gebetsgruppe, Gebetsgruppe.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "gebetsgruppe_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# This is for Acceptance Testing
# You need to start phantomjs with "$ phantomjs --wd" before running these tests.
config :hound, driver: "phantomjs"
  
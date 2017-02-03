# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :secureapp,
  ecto_repos: [Secureapp.Repo]

# Configures the endpoint
config :secureapp, Secureapp.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "aTmYuNSLqTWMbZvpsXd2qevCr6tQN9MFh7jcWWJjE6K3s+Sg2Pw5bn0CCOHitiTo",
  render_errors: [view: Secureapp.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Secureapp.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :guardian, Guardian,
  allowed_algos: ["HS512"],
  verify_module: Guardian.JWT,
  issuer: "Secureapp",
  ttl: { 30, :days},
  verify_issuer: true,
  secret_key: "<your secret guardian key>",
  serializer: Secureapp.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

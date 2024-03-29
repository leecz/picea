# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :picea,
  ecto_repos: [Picea.Repo]

# Configures the endpoint
config :picea, PiceaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "eoEIX2V+Xo67PSKNIHvOeBc2TqCFj6BgEhIS4tOEaHWhYQRoON05yqJLQ793CoMY",
  render_errors: [view: PiceaWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Picea.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.

config :picea, Picea.Guardian,
  issuer: "picea",
  secret_key: "zc4CdebhPzSgx+DlMyZQo3JYbitLws/YweJmnpin76B9JjP8+V8uSiBcwOjfwi1c"

import_config "#{Mix.env()}.exs"

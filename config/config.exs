# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :sky_feed,
  ecto_repos: [SkyFeed.Repo]

# Configures the endpoint
config :sky_feed, SkyFeed.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "HyfXTlJOc4cFZZztAsp9hH5A6mvPnR/kmyl9/49MlzIOJGu3Znh6VbBYjrArE3QG",
  render_errors: [view: SkyFeed.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SkyFeed.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

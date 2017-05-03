defmodule SkyFeed.Feed.Commit do
  use Ecto.Schema

  schema "feed_commits" do
    field :message, :string
    field :author, :string
    field :timestamp, :string

    timestamps()
  end
end

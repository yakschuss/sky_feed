defmodule SkyFeed.Repo.Migrations.CreateSkyFeed.Feed.Commit do
  use Ecto.Migration

  def change do
    create table(:feed_commits) do
      add :message, :string
      add :author, :string

      timestamps()
    end

  end
end

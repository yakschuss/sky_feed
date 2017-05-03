defmodule SkyFeed.Repo.Migrations.AddTimestampToCommit do
  use Ecto.Migration

  def change do
    alter table(:feed_commits) do
      add :timestamp, :string
    end
  end
end

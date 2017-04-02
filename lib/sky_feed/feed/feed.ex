defmodule SkyFeed.Feed do
  @moduledoc """
  The boundary for the Feed system.
  """

  import Ecto.{Query, Changeset}, warn: false
  alias SkyFeed.Repo

  alias SkyFeed.Feed.Commit
  alias SkyFeed.Feed.Publish

  def xml_commits do
    list_commits
    |> Enum.map(fn(commit) -> 
     Publish.item(
       commit_description(commit),
       commit_description(commit),
       "link",
       commit.id
     )
    end)
  end

  def commit_description(commit) do
    commit.author <> " " <> commit.message
  end

  def list_commits do
    Repo.all(Commit)
  end

  def get_commit!(id), do: Repo.get!(Commit, id)

  def create_commit(attrs \\ %{}) do
    %Commit{}
    |> commit_changeset(attrs)
    |> Repo.insert()
  end

  def update_commit(%Commit{} = commit, attrs) do
    commit
    |> commit_changeset(attrs)
    |> Repo.update()
  end

  def delete_commit(%Commit{} = commit) do
    Repo.delete(commit)
  end

  def change_commit(%Commit{} = commit) do
    commit_changeset(commit, %{})
  end

  defp commit_changeset(%Commit{} = commit, attrs) do
    commit
    |> cast(attrs, [:message, :author])
  end
end

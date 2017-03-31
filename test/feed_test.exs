defmodule SkyFeed.FeedTest do
  use SkyFeed.DataCase

  alias SkyFeed.Feed
  alias SkyFeed.Feed.Commit

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:commit, attrs \\ @create_attrs) do
    {:ok, commit} = Feed.create_commit(attrs)
    commit
  end

  test "list_commits/1 returns all commits" do
    commit = fixture(:commit)
    assert Feed.list_commits() == [commit]
  end

  test "get_commit! returns the commit with given id" do
    commit = fixture(:commit)
    assert Feed.get_commit!(commit.id) == commit
  end

  test "create_commit/1 with valid data creates a commit" do
    assert {:ok, %Commit{} = commit} = Feed.create_commit(@create_attrs)
  end

  test "create_commit/1 with invalid data returns error changeset" do
    assert {:error, %Ecto.Changeset{}} = Feed.create_commit(@invalid_attrs)
  end

  test "update_commit/2 with valid data updates the commit" do
    commit = fixture(:commit)
    assert {:ok, commit} = Feed.update_commit(commit, @update_attrs)
    assert %Commit{} = commit
  end

  test "update_commit/2 with invalid data returns error changeset" do
    commit = fixture(:commit)
    assert {:error, %Ecto.Changeset{}} = Feed.update_commit(commit, @invalid_attrs)
    assert commit == Feed.get_commit!(commit.id)
  end

  test "delete_commit/1 deletes the commit" do
    commit = fixture(:commit)
    assert {:ok, %Commit{}} = Feed.delete_commit(commit)
    assert_raise Ecto.NoResultsError, fn -> Feed.get_commit!(commit.id) end
  end

  test "change_commit/1 returns a commit changeset" do
    commit = fixture(:commit)
    assert %Ecto.Changeset{} = Feed.change_commit(commit)
  end
end

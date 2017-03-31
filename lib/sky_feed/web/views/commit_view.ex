defmodule SkyFeed.Web.CommitView do
  use SkyFeed.Web, :view
  alias SkyFeed.Web.CommitView

  def render("index.json", %{commits: commits}) do
    %{data: render_many(commits, CommitView, "commit.json")}
  end

  def render("show.json", %{commit: commit}) do
    %{data: render_one(commit, CommitView, "commit.json")}
  end

  def render("commit.json", %{commit: commit}) do
    %{id: commit.id}
  end
end

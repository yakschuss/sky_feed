defmodule SkyFeed.Web.FeedController do
  use SkyFeed.Web, :controller

  alias SkyFeed.Feed.Commit

  def index(conn, _params) do
    commits = SkyFeed.Feed.list_commits
    conn
    |> put_layout(:none)
    |> put_resp_content_type("application/xml")
    |> render("index.xml", commits: commits)
  end
end

defmodule SkyFeed.Web.FeedController do
  use SkyFeed.Web, :controller

  alias SkyFeed.Feed.Commit

  def index(conn, _params) do
    commits = Repo.all from c in Commit, order_by: [desc: c.id]
    conn
    |> put_layout(:none)
    |> put_resp_content_type("application/xml")
    |> render "index.xml", items: commits
  end
end

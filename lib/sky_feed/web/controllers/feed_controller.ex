defmodule SkyFeed.Web.FeedController do
  use SkyFeed.Web, :controller

  alias SkyFeed.Feed

  def index(conn, _params) do
    render conn, "index.html"
  end
end

defmodule SkyFeed.Web.CommitController do
  use SkyFeed.Web, :controller

  def create(conn, %{"payload" => payload}) do
    SkyFeed.Feed.Parse.parse(payload)

    send_resp(conn, :ok, "")
  end

end

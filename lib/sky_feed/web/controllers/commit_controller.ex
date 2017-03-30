defmodule SkyFeed.Web.CommitController do
  use SkyFeed.Web, :controller
  
  def create(conn, %{"payload" => payload}) do
    SkyFeed.Parser.Parse.parse(payload)
    |> IO.inspect
    
    send_resp(conn, :ok, "")
  end

end

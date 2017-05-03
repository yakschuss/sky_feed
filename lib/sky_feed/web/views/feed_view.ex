defmodule SkyFeed.Web.FeedView do
  use SkyFeed.Web, :view


  def date_format(commit) do
    {:ok, date } = commit.inserted_at
    |> Ecto.DateTime.to_iso8601
    |> DateFormat.parse("{ISOz}")

    {:ok, date} = DateFormat.format(date, "%a, %d %b %Y %H:%M:%S %z", :strftime)

    date
  end
end

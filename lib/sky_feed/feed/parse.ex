defmodule SkyFeed.Feed.Parse do
  require IEx

  def parse(payload) do
    Poison.Parser.parse!(payload)
    |> Map.get("commits")
    |> Enum.map(fn(commit) ->
     %{
       author: parse_author(commit["author"]["name"]),
       message: parse_message(commit["message"]),
       timestamp: parse_time_stamp(DateTime.from_iso8601(commit["timestamp"]))
     }
    end)
    |> Enum.filter(fn(commit) ->
     !is_nil(commit[:message])
    end)
    |> Enum.map(fn(commit) ->
      IO.inspect(commit)
      SkyFeed.Feed.create_commit(commit)
    end)
  end

  defp parse_message("p:"<> message) do
    message
  end

  defp parse_message("h:"<> _message) do
    nil
  end

  defp parse_message(_message) do
    "Content Hidden"
  end

  defp parse_author(name) do
   [first_name | last_name] =  String.split(name)
   first_name
  end

  defp parse_time_stamp({:ok, date, _offset}) do
    "#{date.month}/#{date.day}/#{date.year}"
  end
end

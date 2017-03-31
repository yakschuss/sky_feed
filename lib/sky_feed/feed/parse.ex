defmodule SkyFeed.Feed.Parse do
  def parse(payload) do
    Poison.Parser.parse!(payload)
    |> Map.get("commits")
    |> Enum.map(fn(commit) ->
     %{
       author: parse_author(commit["author"]["name"]),
       message: parse_message(commit["message"])
     }
    end)
    |> Enum.filter(fn(commit) ->
     !is_nil(commit[:message])
    end)
    |> Enum.map(fn(commit) ->
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
end

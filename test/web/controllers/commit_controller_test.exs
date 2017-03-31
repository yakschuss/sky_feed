defmodule SkyFeed.Web.CommitControllerTest do
  use SkyFeed.Web.ConnCase

  alias SkyFeed.Feed
  alias SkyFeed.Feed.Commit

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:commit) do
    {:ok, commit} = Feed.create_commit(@create_attrs)
    commit
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, commit_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "creates commit and renders commit when data is valid", %{conn: conn} do
    conn = post conn, commit_path(conn, :create), commit: @create_attrs
    assert %{"id" => id} = json_response(conn, 201)["data"]

    conn = get conn, commit_path(conn, :show, id)
    assert json_response(conn, 200)["data"] == %{
      "id" => id}
  end

  test "does not create commit and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, commit_path(conn, :create), commit: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates chosen commit and renders commit when data is valid", %{conn: conn} do
    %Commit{id: id} = commit = fixture(:commit)
    conn = put conn, commit_path(conn, :update, commit), commit: @update_attrs
    assert %{"id" => ^id} = json_response(conn, 200)["data"]

    conn = get conn, commit_path(conn, :show, id)
    assert json_response(conn, 200)["data"] == %{
      "id" => id}
  end

  test "does not update chosen commit and renders errors when data is invalid", %{conn: conn} do
    commit = fixture(:commit)
    conn = put conn, commit_path(conn, :update, commit), commit: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen commit", %{conn: conn} do
    commit = fixture(:commit)
    conn = delete conn, commit_path(conn, :delete, commit)
    assert response(conn, 204)
    assert_error_sent 404, fn ->
      get conn, commit_path(conn, :show, commit)
    end
  end
end

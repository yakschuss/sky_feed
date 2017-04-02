defmodule SkyFeed.Web.Router do
  use SkyFeed.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SkyFeed.Web do
    pipe_through :browser # Use the default browser stack


    get "/", PageController, :index
  end

  scope "/rss", SkyFeed.Web do
    get "/commits", FeedController, :index
  end


  # Other scopes may use custom stacks.
  scope "/api", SkyFeed.Web do
    pipe_through :api

    post "/commit-feed", CommitController, :create
  end
end

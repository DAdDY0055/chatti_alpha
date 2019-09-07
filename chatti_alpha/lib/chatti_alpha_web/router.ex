defmodule ChattiAlphaWeb.Router do
  use ChattiAlphaWeb, :router

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

  scope "/", ChattiAlphaWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/chats", ChatController
    resources "/room", RoomController, only: [:index]
  end

  # Other scopes may use custom stacks.
  # scope "/api", ChattiAlphaWeb do
  #   pipe_through :api
  # end
end

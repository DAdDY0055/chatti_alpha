defmodule ChattiAlphaWeb.Router do
  use ChattiAlphaWeb, :router
  alias ChattiAlpha.Token # TODO: 別に切り出したい

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :veryfy_user_token
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

  scope "/api", ChattiAlphaWeb do
    pipe_through :api

    resources "/users", UserController, except: [:new, :edit]
  end

  defp veryfy_user_token(conn, _prams) do
    token = conn.params["token"]

    case Token.verify_and_validate(token) do
      {:ok, claims} ->
        assign(conn, :user_token, claims["gid"])
      _ ->
        IO.inspect(conn: conn)
        conn
    end
  end

end

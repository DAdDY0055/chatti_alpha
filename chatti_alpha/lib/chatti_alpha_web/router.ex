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

    get "/", RoomController, :index
    # resources "/chats", ChatController
    resources "/room", RoomController, only: [:index]
  end

  scope "/api", ChattiAlphaWeb do
    pipe_through :api

    resources "/users", UserController, only: [:create]
  end

  defp veryfy_user_token(conn, _prams) do
    token = conn.params["token"]

    if token do
      case Token.verify_and_validate(token) do
        {:ok, claims} ->
          conn
          |> assign(:room_id, claims["room_id"])
          |> assign(:room_name, claims["room_name"])
          |> assign(:user_id, claims["uid"])
          |> assign(:user_name, claims["name"])
          |> assign(:tenant_id, claims["tenant_id"])

          _ ->
          conn
          |> assign(:error, "unauthorized")
      end
    else
      conn
      |> assign(:error, "unauthorized")
    end
  end

end

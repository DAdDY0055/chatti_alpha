defmodule ChattiAlphaWeb.UserController do
  use ChattiAlphaWeb, :controller

  alias ChattiAlpha.Accounts
  alias ChattiAlpha.Accounts.UserSchema
  alias ChattiAlpha.Token

  action_fallback ChattiAlphaWeb.FallbackController

  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, user_params) do
    # TODO: user_paramsのバリデーション
    with {:ok, %UserSchema{} = user} <- Accounts.create_user(user_params) do
      token = Token.generate_and_sign!(user_params)

      conn
      # |> put_status(:created)
      # |> put_resp_header("location", Routes.user_path(conn, :show, user)) TODO: ここでチャットへのレスポンスを入れる
      # |> render("show.json", token: token)
      |> render("token.json", token: token)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Accounts.get_user!(id)

    with {:ok, %UserSchema{} = user} <- Accounts.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)

    with {:ok, %UserSchema{}} <- Accounts.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end

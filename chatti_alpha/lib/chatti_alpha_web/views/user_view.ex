defmodule ChattiAlphaWeb.UserView do
  use ChattiAlphaWeb, :view
  alias ChattiAlphaWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      uid: user.uid,
      name: user.name,
      room_id: user.room_id,
      room_name: user.room_name,
      tenant_id: user.tenant_id}
  end

  def render("token.json", %{token: token}) do
    %{token: token}
  end
end

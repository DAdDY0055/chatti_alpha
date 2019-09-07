defmodule ChattiAlphaWeb.RoomController do
  use ChattiAlphaWeb, :controller

  alias ChattiAlpha.ChatRooms
  alias ChattiAlpha.ChatRooms.Chat

  def index(conn, _params) do
    chats = ChatRooms.list_chats()
    render(conn, "index.html", chats: chats)
  end
end

defmodule ChattiAlphaWeb.RoomController do
  use ChattiAlphaWeb, :controller

  alias ChattiAlpha.ChatRooms

  def index(conn, _params) do
    # ここでUIDとRoomIdで制御する
    # 本当はサービスで作るか
    chats = ChatRooms.get_info_by_room(conn.assigns.room_id)

    conn
    |> assign(:user_name, conn.assigns.user_name)
    |> assign(:room_name, conn.assigns.room_name)
    |> assign(:chats, chats)
    |> render("index.html")
  end
end

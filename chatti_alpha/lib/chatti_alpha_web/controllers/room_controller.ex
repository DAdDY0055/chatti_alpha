defmodule ChattiAlphaWeb.RoomController do
  use ChattiAlphaWeb, :controller

  alias ChattiAlpha.ChatRooms

  def index(conn, _params) do
    IO.inspect(room_index_conn_assigns: conn.assigns)

    # ここでUIDとRoomIdで制御する
    # 本当はサービスで作るか
    chats = ChatRooms.list_chats()
    render(conn, "index.html", chats: chats)
  end
end

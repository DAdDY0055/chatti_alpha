defmodule ChattiAlphaWeb.RoomChannel do
  use Phoenix.Channel
  alias ChattiAlpha.ChatRooms

  def join("room:" <> room_id, payload, socket) do
    # どうやってここに渡ってるんだっけ？
    # IO.inspect(room_id: room_id)
    {:ok, socket}
  end

  def join("room:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end

  def handle_in("new_msg", payload, socket) do
    IO.inspect(payload: payload)
    # IO.inspect(payload)
    case ChatRooms.create_chat(payload) do
      {:ok, _} ->
        IO.inspect("ok")
      {:error, changeset} ->
        IO.inspect("error")
    end

    broadcast! socket, "new_msg", payload
    {:reply, {:ok, payload}, socket}
  end

  def handle_in("ping", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  defp load_messages() do
    ChatRooms.list_chats()
    |> Enum.map(fn messages ->  messages end)
  end

end

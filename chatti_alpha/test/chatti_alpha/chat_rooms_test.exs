defmodule ChattiAlpha.ChatRoomsTest do
  use ChattiAlpha.DataCase

  alias ChattiAlpha.ChatRooms

  describe "chats" do
    alias ChattiAlpha.ChatRooms.Chat

    @valid_attrs %{chat_name: "some chat_name", post: "some post", rooom_id: 42, tenant_id: 42, user_id: 42, user_name: "some user_name"}
    @update_attrs %{chat_name: "some updated chat_name", post: "some updated post", rooom_id: 43, tenant_id: 43, user_id: 43, user_name: "some updated user_name"}
    @invalid_attrs %{chat_name: nil, post: nil, rooom_id: nil, tenant_id: nil, user_id: nil, user_name: nil}

    def chat_fixture(attrs \\ %{}) do
      {:ok, chat} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ChatRooms.create_chat()

      chat
    end

    test "list_chats/0 returns all chats" do
      chat = chat_fixture()
      assert ChatRooms.list_chats() == [chat]
    end

    test "get_chat!/1 returns the chat with given id" do
      chat = chat_fixture()
      assert ChatRooms.get_chat!(chat.id) == chat
    end

    test "create_chat/1 with valid data creates a chat" do
      assert {:ok, %Chat{} = chat} = ChatRooms.create_chat(@valid_attrs)
      assert chat.chat_name == "some chat_name"
      assert chat.post == "some post"
      assert chat.rooom_id == 42
      assert chat.tenant_id == 42
      assert chat.user_id == 42
      assert chat.user_name == "some user_name"
    end

    test "create_chat/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ChatRooms.create_chat(@invalid_attrs)
    end

    test "update_chat/2 with valid data updates the chat" do
      chat = chat_fixture()
      assert {:ok, %Chat{} = chat} = ChatRooms.update_chat(chat, @update_attrs)
      assert chat.chat_name == "some updated chat_name"
      assert chat.post == "some updated post"
      assert chat.rooom_id == 43
      assert chat.tenant_id == 43
      assert chat.user_id == 43
      assert chat.user_name == "some updated user_name"
    end

    test "update_chat/2 with invalid data returns error changeset" do
      chat = chat_fixture()
      assert {:error, %Ecto.Changeset{}} = ChatRooms.update_chat(chat, @invalid_attrs)
      assert chat == ChatRooms.get_chat!(chat.id)
    end

    test "delete_chat/1 deletes the chat" do
      chat = chat_fixture()
      assert {:ok, %Chat{}} = ChatRooms.delete_chat(chat)
      assert_raise Ecto.NoResultsError, fn -> ChatRooms.get_chat!(chat.id) end
    end

    test "change_chat/1 returns a chat changeset" do
      chat = chat_fixture()
      assert %Ecto.Changeset{} = ChatRooms.change_chat(chat)
    end
  end
end

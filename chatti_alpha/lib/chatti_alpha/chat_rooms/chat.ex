defmodule ChattiAlpha.ChatRooms.Chat do
  use Ecto.Schema
  import Ecto.Changeset

  schema "chats" do
    field(:chat_name, :string)
    field(:post, :string)
    field(:rooom_id, :integer)
    field(:tenant_id, :integer)
    field(:user_id, :integer)
    field(:user_name, :string)

    timestamps()
  end

  @doc false
  def changeset(chat, attrs) do
    chat
    |> cast(attrs, [:user_id, :user_name, :rooom_id, :chat_name, :tenant_id, :post])
    # |> validate_required([:user_id, :user_name, :rooom_id, :chat_name, :tenant_id, :post])
  end
end

defmodule ChattiAlpha.Repo.Migrations.CreateChats do
  use Ecto.Migration

  def change do
    create table(:chats) do
      add :user_id, :integer
      add :user_name, :string
      add :rooom_id, :integer
      add :chat_name, :string
      add :tenant_id, :integer
      add :post, :string

      timestamps()
    end

  end
end

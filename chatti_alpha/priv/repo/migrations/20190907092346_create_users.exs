defmodule ChattiAlpha.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :uid, :integer
      add :name, :string
      add :room_id, :integer
      add :room_name, :string
      add :tenant_id, :integer

      timestamps()
    end

  end
end

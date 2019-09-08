defmodule ChattiAlpha.Accounts.UserSchema do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :room_id, :integer
    field :room_name, :string
    field :tenant_id, :integer
    field :uid, :integer

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:uid, :name, :room_id, :room_name, :tenant_id])
    # |> validate_required([:uid, :name, :room_id, :room_name, :tenant_id])
  end
end

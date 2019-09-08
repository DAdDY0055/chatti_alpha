defmodule ChattiAlpha.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias ChattiAlpha.Repo

  alias ChattiAlpha.Accounts.UserSchema

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%UserSchema{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %UserSchema{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %UserSchema{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %UserSchema{}
    |> UserSchema.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %UserSchema{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%UserSchema{} = user, attrs) do
    user
    |> UserSchema.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a UserSchema.

  ## Examples

      iex> delete_user(user)
      {:ok, %UserSchema{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%UserSchema{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{source: %UserSchema{}}

  """
  def change_user(%UserSchema{} = user) do
    UserSchema.changeset(user, %{})
  end
end

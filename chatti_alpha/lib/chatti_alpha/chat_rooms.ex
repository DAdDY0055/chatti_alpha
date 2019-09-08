defmodule ChattiAlpha.ChatRooms do
  @moduledoc """
  The ChatRooms context.
  """

  import Ecto.Query, warn: false
  alias ChattiAlpha.Repo

  alias ChattiAlpha.ChatRooms.ChatSchema

  @doc """
  Returns the list of chats.

  ## Examples

      iex> list_chats()
      [%ChatSchema{}, ...]

  """
  def list_chats do
    Repo.all(ChatSchema)
  end

  @doc """
  RoomIDに応じた過去履歴を取得する
  """
  def get_info_by_room(room_id) do
    # TODO: カラム名が`rooom_id`なので直す
    Repo.get_by(ChatSchema, rooom_id: room_id)
  end

  @doc """
  Gets a single chat.

  Raises `Ecto.NoResultsError` if the Chat does not exist.

  ## Examples

      iex> get_chat!(123)
      %ChatSchema{}

      iex> get_chat!(456)
      ** (Ecto.NoResultsError)

  """
  def get_chat!(id), do: Repo.get!(ChatSchema, id)

  @doc """
  Creates a chat.

  ## Examples

      iex> create_chat(%{field: value})
      {:ok, %ChatSchema{}}

      iex> create_chat(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  # TODO: payloadをここに渡す
  def create_chat(attrs \\ %{}) do
    %ChatSchema{}
    |> ChatSchema.changeset(attrs)
    |> Repo.insert()
  end

  # def save(payload) do
  #   changeset = changeset(__struct__, payload)

  #   Repo.insert(changeset)
  # end

  @doc """
  Updates a chat.

  ## Examples

      iex> update_chat(chat, %{field: new_value})
      {:ok, %ChatSchema{}}

      iex> update_chat(chat, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_chat(%ChatSchema{} = chat, attrs) do
    chat
    |> ChatSchema.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a ChatSchema.

  ## Examples

      iex> delete_chat(chat)
      {:ok, %ChatSchema{}}

      iex> delete_chat(chat)
      {:error, %Ecto.Changeset{}}

  """
  def delete_chat(%ChatSchema{} = chat) do
    Repo.delete(chat)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking chat changes.

  ## Examples

      iex> change_chat(chat)
      %Ecto.Changeset{source: %ChatSchema{}}

  """
  def change_chat(%ChatSchema{} = chat) do
    ChatSchema.changeset(chat, %{})
  end
end

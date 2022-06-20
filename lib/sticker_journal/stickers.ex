defmodule StickerJournal.Stickers do
  @moduledoc """
  The Stickers context.
  """

  import Ecto.Query, warn: false
  alias StickerJournal.Repo

  alias StickerJournal.Stickers.StickerType

  @doc """
  Returns the list of sticker_type.

  ## Examples

      iex> list_sticker_type()
      [%StickerType{}, ...]

  """
  def list_sticker_type do
    Repo.all(StickerType)
  end

  @doc """
  Gets a single sticker_type.

  Raises `Ecto.NoResultsError` if the Sticker type does not exist.

  ## Examples

      iex> get_sticker_type!(123)
      %StickerType{}

      iex> get_sticker_type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_sticker_type!(id), do: Repo.get!(StickerType, id)

  @doc """
  Creates a sticker_type.

  ## Examples

      iex> create_sticker_type(%{field: value})
      {:ok, %StickerType{}}

      iex> create_sticker_type(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_sticker_type(attrs \\ %{}) do
    %StickerType{}
    |> StickerType.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a sticker_type.

  ## Examples

      iex> update_sticker_type(sticker_type, %{field: new_value})
      {:ok, %StickerType{}}

      iex> update_sticker_type(sticker_type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_sticker_type(%StickerType{} = sticker_type, attrs) do
    sticker_type
    |> StickerType.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a sticker_type.

  ## Examples

      iex> delete_sticker_type(sticker_type)
      {:ok, %StickerType{}}

      iex> delete_sticker_type(sticker_type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_sticker_type(%StickerType{} = sticker_type) do
    Repo.delete(sticker_type)
  end

  def change_sticker_type(%StickerType{} = sticker_type, attrs \\ %{}) do
    StickerType.changeset(sticker_type, attrs)
  end

end

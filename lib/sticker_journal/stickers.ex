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


  alias StickerJournal.Stickers.StickerGroup

  @doc """
  Returns the list of sticker_group.

  ## Examples

      iex> list_sticker_group()
      [%StickerGroup{}, ...]

  """
  def list_sticker_group do
    Repo.all(StickerGroup)
  end

  @doc """
  Gets a single sticker_group.

  Raises `Ecto.NoResultsError` if the Sticker group does not exist.

  ## Examples

      iex> get_sticker_group!(123)
      %StickerGroup{}

      iex> get_sticker_group!(456)
      ** (Ecto.NoResultsError)

  """
  def get_sticker_group!(id), do: Repo.get!(StickerGroup, id)

  @doc """
  Creates a sticker_group.

  ## Examples

      iex> create_sticker_group(%{field: value})
      {:ok, %StickerGroup{}}

      iex> create_sticker_group(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_sticker_group(attrs \\ %{}) do
    %StickerGroup{}
    |> StickerGroup.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a sticker_group.

  ## Examples

      iex> update_sticker_group(sticker_group, %{field: new_value})
      {:ok, %StickerGroup{}}

      iex> update_sticker_group(sticker_group, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_sticker_group(%StickerGroup{} = sticker_group, attrs) do
    sticker_group
    |> StickerGroup.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a sticker_group.

  ## Examples

      iex> delete_sticker_group(sticker_group)
      {:ok, %StickerGroup{}}

      iex> delete_sticker_group(sticker_group)
      {:error, %Ecto.Changeset{}}

  """
  def delete_sticker_group(%StickerGroup{} = sticker_group) do
    Repo.delete(sticker_group)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking sticker_group changes.

  ## Examples

      iex> change_sticker_group(sticker_group)
      %Ecto.Changeset{data: %StickerGroup{}}

  """
  def change_sticker_group(%StickerGroup{} = sticker_group, attrs \\ %{}) do
    StickerGroup.changeset(sticker_group, attrs)
  end
end

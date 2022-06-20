defmodule StickerJournal.StickersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `StickerJournal.Stickers` context.
  """

  @doc """
  Generate a sticker_type.
  """
  def sticker_type_fixture(attrs \\ %{}) do
    {:ok, sticker_type} =
      attrs
      |> Enum.into(%{
        image: "some image",
        key: "some key",
        name: "some name"
      })
      |> StickerJournal.Stickers.create_sticker_type()

    sticker_type
  end


  @doc """
  Generate a sticker_group.
  """
  def sticker_group_fixture(attrs \\ %{}) do
    {:ok, sticker_group} =
      attrs
      |> Enum.into(%{
        key: "some key",
        members: []
      })
      |> StickerJournal.Stickers.create_sticker_group()

    sticker_group
  end
end

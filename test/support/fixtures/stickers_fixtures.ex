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

end

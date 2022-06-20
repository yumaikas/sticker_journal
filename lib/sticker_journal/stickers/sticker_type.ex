defmodule StickerJournal.Stickers.StickerType do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sticker_type" do
    field :image, :string
    field :key, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(sticker_type, attrs) do
    sticker_type
    |> cast(attrs, [:image, :key, :name])
    |> validate_required([:image, :key, :name])
  end
end

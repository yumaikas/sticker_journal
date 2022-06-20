defmodule StickerJournal.Stickers.StickerGroup do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sticker_group" do
    field :key, :string
    field :members, {:array, :string}

    timestamps()
  end

  @doc false
  def changeset(sticker_group, attrs) do
    sticker_group
    |> cast(attrs, [:key, :members])
    |> validate_required([:key, :members])
  end
end

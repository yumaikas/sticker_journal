defmodule StickerJournal.Repo.Migrations.CreateStickerGroup do
  use Ecto.Migration

  def change do
    create table(:sticker_group) do
      add :key, :string
      add :members, {:array, :string}

      timestamps()
    end
  end
end

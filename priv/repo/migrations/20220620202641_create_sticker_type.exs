defmodule StickerJournal.Repo.Migrations.CreateStickerType do
  use Ecto.Migration

  def change do
    create table(:sticker_type) do
      add :image, :string
      add :key, :string
      add :name, :string

      timestamps()
    end
  end
end

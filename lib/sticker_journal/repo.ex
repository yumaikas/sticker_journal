defmodule StickerJournal.Repo do
  use Ecto.Repo,
    otp_app: :sticker_journal,
    adapter: Ecto.Adapters.SQLite3
end

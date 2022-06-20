defmodule StickerJournalWeb.PageController do
  use StickerJournalWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

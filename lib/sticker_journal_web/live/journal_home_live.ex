defmodule StickerJournalWeb.JournalHomeLive do
  use StickerJournalWeb, :live_view


  def mount(_params, _session, socket) do
    socket = assign(socket, :days, [])
    {:ok, socket}
  end

  def handle_params(_params, _uri, socket) do
    {:noreply, socket}
  end

  # View helpers
  def dayRow(%{day: day} = assigns) do
    ~H"""
    <div>This was a day :D </div>
    """
  end


end

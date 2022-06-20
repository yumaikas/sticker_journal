defmodule StickerJournalWeb.StickerTypeLive.Show do
  use StickerJournalWeb, :live_view

  alias StickerJournal.Stickers

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:sticker_type, Stickers.get_sticker_type!(id))}
  end

  defp page_title(:show), do: "Show Sticker type"
  defp page_title(:edit), do: "Edit Sticker type"
end

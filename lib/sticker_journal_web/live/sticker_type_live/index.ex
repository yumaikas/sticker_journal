defmodule StickerJournalWeb.StickerTypeLive.Index do
  use StickerJournalWeb, :live_view

  alias StickerJournal.Stickers
  alias StickerJournal.Stickers.StickerType

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :sticker_type_collection, list_sticker_type())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Sticker type")
    |> assign(:sticker_type, Stickers.get_sticker_type!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Sticker type")
    |> assign(:sticker_type, %StickerType{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Sticker type")
    |> assign(:sticker_type, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    sticker_type = Stickers.get_sticker_type!(id)
    {:ok, _} = Stickers.delete_sticker_type(sticker_type)

    {:noreply, assign(socket, :sticker_type_collection, list_sticker_type())}
  end

  defp list_sticker_type do
    Stickers.list_sticker_type()
  end
end

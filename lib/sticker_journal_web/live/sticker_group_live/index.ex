defmodule StickerJournalWeb.StickerGroupLive.Index do
  use StickerJournalWeb, :live_view

  alias StickerJournal.Stickers
  alias StickerJournal.Stickers.StickerGroup

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :sticker_group_collection, list_sticker_group())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Sticker group")
    |> assign(:sticker_group, Stickers.get_sticker_group!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Sticker group")
    |> assign(:sticker_group, %StickerGroup{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Sticker group")
    |> assign(:sticker_group, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    sticker_group = Stickers.get_sticker_group!(id)
    {:ok, _} = Stickers.delete_sticker_group(sticker_group)

    {:noreply, assign(socket, :sticker_group_collection, list_sticker_group())}
  end

  defp list_sticker_group do
    Stickers.list_sticker_group()
  end
end

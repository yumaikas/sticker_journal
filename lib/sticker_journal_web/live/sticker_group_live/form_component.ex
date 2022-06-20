defmodule StickerJournalWeb.StickerGroupLive.FormComponent do
  use StickerJournalWeb, :live_component

  alias StickerJournal.Stickers

  @impl true
  def update(%{sticker_group: sticker_group} = assigns, socket) do
    changeset = Stickers.change_sticker_group(sticker_group)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"sticker_group" => sticker_group_params}, socket) do
    changeset =
      socket.assigns.sticker_group
      |> Stickers.change_sticker_group(sticker_group_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"sticker_group" => sticker_group_params}, socket) do
    save_sticker_group(socket, socket.assigns.action, sticker_group_params)
  end

  defp save_sticker_group(socket, :edit, sticker_group_params) do
    case Stickers.update_sticker_group(socket.assigns.sticker_group, sticker_group_params) do
      {:ok, _sticker_group} ->
        {:noreply,
         socket
         |> put_flash(:info, "Sticker group updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_sticker_group(socket, :new, sticker_group_params) do
    case Stickers.create_sticker_group(sticker_group_params) do
      {:ok, _sticker_group} ->
        {:noreply,
         socket
         |> put_flash(:info, "Sticker group created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end

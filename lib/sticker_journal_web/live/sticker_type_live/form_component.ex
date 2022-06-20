defmodule StickerJournalWeb.StickerTypeLive.FormComponent do
  use StickerJournalWeb, :live_component

  alias StickerJournal.Stickers

  @impl true
  def update(%{sticker_type: sticker_type} = assigns, socket) do
    changeset = Stickers.change_sticker_type(sticker_type)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"sticker_type" => sticker_type_params}, socket) do
    changeset =
      socket.assigns.sticker_type
      |> Stickers.change_sticker_type(sticker_type_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"sticker_type" => sticker_type_params}, socket) do
    save_sticker_type(socket, socket.assigns.action, sticker_type_params)
  end

  defp save_sticker_type(socket, :edit, sticker_type_params) do
    case Stickers.update_sticker_type(socket.assigns.sticker_type, sticker_type_params) do
      {:ok, _sticker_type} ->
        {:noreply,
         socket
         |> put_flash(:info, "Sticker type updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_sticker_type(socket, :new, sticker_type_params) do
    case Stickers.create_sticker_type(sticker_type_params) do
      {:ok, _sticker_type} ->
        {:noreply,
         socket
         |> put_flash(:info, "Sticker type created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end

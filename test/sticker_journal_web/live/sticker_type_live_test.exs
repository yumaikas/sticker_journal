defmodule StickerJournalWeb.StickerTypeLiveTest do
  use StickerJournalWeb.ConnCase

  import Phoenix.LiveViewTest
  import StickerJournal.StickersFixtures

  @create_attrs %{image: "some image", key: "some key", name: "some name"}
  @update_attrs %{image: "some updated image", key: "some updated key", name: "some updated name"}
  @invalid_attrs %{image: nil, key: nil, name: nil}

  defp create_sticker_type(_) do
    sticker_type = sticker_type_fixture()
    %{sticker_type: sticker_type}
  end

  describe "Index" do
    setup [:create_sticker_type]

    test "lists all sticker_type", %{conn: conn, sticker_type: sticker_type} do
      {:ok, _index_live, html} = live(conn, Routes.sticker_type_index_path(conn, :index))

      assert html =~ "Listing Sticker type"
      assert html =~ sticker_type.image
    end

    test "saves new sticker_type", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.sticker_type_index_path(conn, :index))

      assert index_live |> element("a", "New Sticker type") |> render_click() =~
               "New Sticker type"

      assert_patch(index_live, Routes.sticker_type_index_path(conn, :new))

      assert index_live
             |> form("#sticker_type-form", sticker_type: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#sticker_type-form", sticker_type: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.sticker_type_index_path(conn, :index))

      assert html =~ "Sticker type created successfully"
      assert html =~ "some image"
    end

    test "updates sticker_type in listing", %{conn: conn, sticker_type: sticker_type} do
      {:ok, index_live, _html} = live(conn, Routes.sticker_type_index_path(conn, :index))

      assert index_live |> element("#sticker_type-#{sticker_type.id} a", "Edit") |> render_click() =~
               "Edit Sticker type"

      assert_patch(index_live, Routes.sticker_type_index_path(conn, :edit, sticker_type))

      assert index_live
             |> form("#sticker_type-form", sticker_type: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#sticker_type-form", sticker_type: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.sticker_type_index_path(conn, :index))

      assert html =~ "Sticker type updated successfully"
      assert html =~ "some updated image"
    end

    test "deletes sticker_type in listing", %{conn: conn, sticker_type: sticker_type} do
      {:ok, index_live, _html} = live(conn, Routes.sticker_type_index_path(conn, :index))

      assert index_live |> element("#sticker_type-#{sticker_type.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#sticker_type-#{sticker_type.id}")
    end
  end

  describe "Show" do
    setup [:create_sticker_type]

    test "displays sticker_type", %{conn: conn, sticker_type: sticker_type} do
      {:ok, _show_live, html} = live(conn, Routes.sticker_type_show_path(conn, :show, sticker_type))

      assert html =~ "Show Sticker type"
      assert html =~ sticker_type.image
    end

    test "updates sticker_type within modal", %{conn: conn, sticker_type: sticker_type} do
      {:ok, show_live, _html} = live(conn, Routes.sticker_type_show_path(conn, :show, sticker_type))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Sticker type"

      assert_patch(show_live, Routes.sticker_type_show_path(conn, :edit, sticker_type))

      assert show_live
             |> form("#sticker_type-form", sticker_type: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#sticker_type-form", sticker_type: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.sticker_type_show_path(conn, :show, sticker_type))

      assert html =~ "Sticker type updated successfully"
      assert html =~ "some updated image"
    end
  end
end

defmodule StickerJournalWeb.StickerGroupLiveTest do
  use StickerJournalWeb.ConnCase

  import Phoenix.LiveViewTest
  import StickerJournal.StickersFixtures

  @create_attrs %{key: "some key", members: []}
  @update_attrs %{key: "some updated key", members: []}
  @invalid_attrs %{key: nil, members: []}

  defp create_sticker_group(_) do
    sticker_group = sticker_group_fixture()
    %{sticker_group: sticker_group}
  end

  describe "Index" do
    setup [:create_sticker_group]

    test "lists all sticker_group", %{conn: conn, sticker_group: sticker_group} do
      {:ok, _index_live, html} = live(conn, Routes.sticker_group_index_path(conn, :index))

      assert html =~ "Listing Sticker group"
      assert html =~ sticker_group.key
    end

    test "saves new sticker_group", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.sticker_group_index_path(conn, :index))

      assert index_live |> element("a", "New Sticker group") |> render_click() =~
               "New Sticker group"

      assert_patch(index_live, Routes.sticker_group_index_path(conn, :new))

      assert index_live
             |> form("#sticker_group-form", sticker_group: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#sticker_group-form", sticker_group: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.sticker_group_index_path(conn, :index))

      assert html =~ "Sticker group created successfully"
      assert html =~ "some key"
    end

    test "updates sticker_group in listing", %{conn: conn, sticker_group: sticker_group} do
      {:ok, index_live, _html} = live(conn, Routes.sticker_group_index_path(conn, :index))

      assert index_live |> element("#sticker_group-#{sticker_group.id} a", "Edit") |> render_click() =~
               "Edit Sticker group"

      assert_patch(index_live, Routes.sticker_group_index_path(conn, :edit, sticker_group))

      assert index_live
             |> form("#sticker_group-form", sticker_group: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#sticker_group-form", sticker_group: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.sticker_group_index_path(conn, :index))

      assert html =~ "Sticker group updated successfully"
      assert html =~ "some updated key"
    end

    test "deletes sticker_group in listing", %{conn: conn, sticker_group: sticker_group} do
      {:ok, index_live, _html} = live(conn, Routes.sticker_group_index_path(conn, :index))

      assert index_live |> element("#sticker_group-#{sticker_group.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#sticker_group-#{sticker_group.id}")
    end
  end

  describe "Show" do
    setup [:create_sticker_group]

    test "displays sticker_group", %{conn: conn, sticker_group: sticker_group} do
      {:ok, _show_live, html} = live(conn, Routes.sticker_group_show_path(conn, :show, sticker_group))

      assert html =~ "Show Sticker group"
      assert html =~ sticker_group.key
    end

    test "updates sticker_group within modal", %{conn: conn, sticker_group: sticker_group} do
      {:ok, show_live, _html} = live(conn, Routes.sticker_group_show_path(conn, :show, sticker_group))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Sticker group"

      assert_patch(show_live, Routes.sticker_group_show_path(conn, :edit, sticker_group))

      assert show_live
             |> form("#sticker_group-form", sticker_group: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#sticker_group-form", sticker_group: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.sticker_group_show_path(conn, :show, sticker_group))

      assert html =~ "Sticker group updated successfully"
      assert html =~ "some updated key"
    end
  end
end

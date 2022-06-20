defmodule StickerJournal.StickersTest do
  use StickerJournal.DataCase

  alias StickerJournal.Stickers

  describe "sticker_type" do
    alias StickerJournal.Stickers.StickerType

    import StickerJournal.StickersFixtures

    @invalid_attrs %{image: nil, key: nil, name: nil}

    test "list_sticker_type/0 returns all sticker_type" do
      sticker_type = sticker_type_fixture()
      assert Stickers.list_sticker_type() == [sticker_type]
    end

    test "get_sticker_type!/1 returns the sticker_type with given id" do
      sticker_type = sticker_type_fixture()
      assert Stickers.get_sticker_type!(sticker_type.id) == sticker_type
    end

    test "create_sticker_type/1 with valid data creates a sticker_type" do
      valid_attrs = %{image: "some image", key: "some key", name: "some name"}

      assert {:ok, %StickerType{} = sticker_type} = Stickers.create_sticker_type(valid_attrs)
      assert sticker_type.image == "some image"
      assert sticker_type.key == "some key"
      assert sticker_type.name == "some name"
    end

    test "create_sticker_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Stickers.create_sticker_type(@invalid_attrs)
    end

    test "update_sticker_type/2 with valid data updates the sticker_type" do
      sticker_type = sticker_type_fixture()
      update_attrs = %{image: "some updated image", key: "some updated key", name: "some updated name"}

      assert {:ok, %StickerType{} = sticker_type} = Stickers.update_sticker_type(sticker_type, update_attrs)
      assert sticker_type.image == "some updated image"
      assert sticker_type.key == "some updated key"
      assert sticker_type.name == "some updated name"
    end

    test "update_sticker_type/2 with invalid data returns error changeset" do
      sticker_type = sticker_type_fixture()
      assert {:error, %Ecto.Changeset{}} = Stickers.update_sticker_type(sticker_type, @invalid_attrs)
      assert sticker_type == Stickers.get_sticker_type!(sticker_type.id)
    end

    test "delete_sticker_type/1 deletes the sticker_type" do
      sticker_type = sticker_type_fixture()
      assert {:ok, %StickerType{}} = Stickers.delete_sticker_type(sticker_type)
      assert_raise Ecto.NoResultsError, fn -> Stickers.get_sticker_type!(sticker_type.id) end
    end

    test "change_sticker_type/1 returns a sticker_type changeset" do
      sticker_type = sticker_type_fixture()
      assert %Ecto.Changeset{} = Stickers.change_sticker_type(sticker_type)
    end
  end

  describe "sticker_group" do
    alias StickerJournal.Stickers.StickerGroup

    import StickerJournal.StickersFixtures

    @invalid_attrs %{key: nil, memebers: nil}

    test "list_sticker_group/0 returns all sticker_group" do
      sticker_group = sticker_group_fixture()
      assert Stickers.list_sticker_group() == [sticker_group]
    end

    test "get_sticker_group!/1 returns the sticker_group with given id" do
      sticker_group = sticker_group_fixture()
      assert Stickers.get_sticker_group!(sticker_group.id) == sticker_group
    end

    test "create_sticker_group/1 with valid data creates a sticker_group" do
      valid_attrs = %{key: "some key", memebers: []}

      assert {:ok, %StickerGroup{} = sticker_group} = Stickers.create_sticker_group(valid_attrs)
      assert sticker_group.key == "some key"
      assert sticker_group.memebers == []
    end

    test "create_sticker_group/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Stickers.create_sticker_group(@invalid_attrs)
    end

    test "update_sticker_group/2 with valid data updates the sticker_group" do
      sticker_group = sticker_group_fixture()
      update_attrs = %{key: "some updated key", memebers: []}

      assert {:ok, %StickerGroup{} = sticker_group} = Stickers.update_sticker_group(sticker_group, update_attrs)
      assert sticker_group.key == "some updated key"
      assert sticker_group.memebers == []
    end

    test "update_sticker_group/2 with invalid data returns error changeset" do
      sticker_group = sticker_group_fixture()
      assert {:error, %Ecto.Changeset{}} = Stickers.update_sticker_group(sticker_group, @invalid_attrs)
      assert sticker_group == Stickers.get_sticker_group!(sticker_group.id)
    end

    test "delete_sticker_group/1 deletes the sticker_group" do
      sticker_group = sticker_group_fixture()
      assert {:ok, %StickerGroup{}} = Stickers.delete_sticker_group(sticker_group)
      assert_raise Ecto.NoResultsError, fn -> Stickers.get_sticker_group!(sticker_group.id) end
    end

    test "change_sticker_group/1 returns a sticker_group changeset" do
      sticker_group = sticker_group_fixture()
      assert %Ecto.Changeset{} = Stickers.change_sticker_group(sticker_group)
    end
  end

  describe "sticker_group" do
    alias StickerJournal.Stickers.StickerGroup

    import StickerJournal.StickersFixtures

    @invalid_attrs %{key: nil, members: nil}

    test "list_sticker_group/0 returns all sticker_group" do
      sticker_group = sticker_group_fixture()
      assert Stickers.list_sticker_group() == [sticker_group]
    end

    test "get_sticker_group!/1 returns the sticker_group with given id" do
      sticker_group = sticker_group_fixture()
      assert Stickers.get_sticker_group!(sticker_group.id) == sticker_group
    end

    test "create_sticker_group/1 with valid data creates a sticker_group" do
      valid_attrs = %{key: "some key", members: []}

      assert {:ok, %StickerGroup{} = sticker_group} = Stickers.create_sticker_group(valid_attrs)
      assert sticker_group.key == "some key"
      assert sticker_group.members == []
    end

    test "create_sticker_group/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Stickers.create_sticker_group(@invalid_attrs)
    end

    test "update_sticker_group/2 with valid data updates the sticker_group" do
      sticker_group = sticker_group_fixture()
      update_attrs = %{key: "some updated key", members: []}

      assert {:ok, %StickerGroup{} = sticker_group} = Stickers.update_sticker_group(sticker_group, update_attrs)
      assert sticker_group.key == "some updated key"
      assert sticker_group.members == []
    end

    test "update_sticker_group/2 with invalid data returns error changeset" do
      sticker_group = sticker_group_fixture()
      assert {:error, %Ecto.Changeset{}} = Stickers.update_sticker_group(sticker_group, @invalid_attrs)
      assert sticker_group == Stickers.get_sticker_group!(sticker_group.id)
    end

    test "delete_sticker_group/1 deletes the sticker_group" do
      sticker_group = sticker_group_fixture()
      assert {:ok, %StickerGroup{}} = Stickers.delete_sticker_group(sticker_group)
      assert_raise Ecto.NoResultsError, fn -> Stickers.get_sticker_group!(sticker_group.id) end
    end

    test "change_sticker_group/1 returns a sticker_group changeset" do
      sticker_group = sticker_group_fixture()
      assert %Ecto.Changeset{} = Stickers.change_sticker_group(sticker_group)
    end
  end
end

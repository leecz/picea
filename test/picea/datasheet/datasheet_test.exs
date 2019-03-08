defmodule Picea.DatasheetTest do
  use Picea.DataCase

  alias Picea.Datasheet

  describe "sheets" do
    alias Picea.Datasheet.Sheet

    @valid_attrs %{data: %{}, name: "some name"}
    @update_attrs %{data: %{}, name: "some updated name"}
    @invalid_attrs %{data: nil, name: nil}

    def sheet_fixture(attrs \\ %{}) do
      {:ok, sheet} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Datasheet.create_sheet()

      sheet
    end

    test "list_sheets/0 returns all sheets" do
      sheet = sheet_fixture()
      assert Datasheet.list_sheets() == [sheet]
    end

    test "get_sheet!/1 returns the sheet with given id" do
      sheet = sheet_fixture()
      assert Datasheet.get_sheet!(sheet.id) == sheet
    end

    test "create_sheet/1 with valid data creates a sheet" do
      assert {:ok, %Sheet{} = sheet} = Datasheet.create_sheet(@valid_attrs)
      assert sheet.data == %{}
      assert sheet.name == "some name"
    end

    test "create_sheet/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Datasheet.create_sheet(@invalid_attrs)
    end

    test "update_sheet/2 with valid data updates the sheet" do
      sheet = sheet_fixture()
      assert {:ok, %Sheet{} = sheet} = Datasheet.update_sheet(sheet, @update_attrs)
      assert sheet.data == %{}
      assert sheet.name == "some updated name"
    end

    test "update_sheet/2 with invalid data returns error changeset" do
      sheet = sheet_fixture()
      assert {:error, %Ecto.Changeset{}} = Datasheet.update_sheet(sheet, @invalid_attrs)
      assert sheet == Datasheet.get_sheet!(sheet.id)
    end

    test "delete_sheet/1 deletes the sheet" do
      sheet = sheet_fixture()
      assert {:ok, %Sheet{}} = Datasheet.delete_sheet(sheet)
      assert_raise Ecto.NoResultsError, fn -> Datasheet.get_sheet!(sheet.id) end
    end

    test "change_sheet/1 returns a sheet changeset" do
      sheet = sheet_fixture()
      assert %Ecto.Changeset{} = Datasheet.change_sheet(sheet)
    end
  end
end

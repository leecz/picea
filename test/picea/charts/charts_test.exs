defmodule Picea.ChartsTest do
  use Picea.DataCase

  alias Picea.Charts

  describe "charts" do
    alias Picea.Charts.Chart

    @valid_attrs %{name: "some name", option: %{}, type: "some type", type_name: "some type_name"}
    @update_attrs %{name: "some updated name", option: %{}, type: "some updated type", type_name: "some updated type_name"}
    @invalid_attrs %{name: nil, option: nil, type: nil, type_name: nil}

    def chart_fixture(attrs \\ %{}) do
      {:ok, chart} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Charts.create_chart()

      chart
    end

    test "list_charts/0 returns all charts" do
      chart = chart_fixture()
      assert Charts.list_charts() == [chart]
    end

    test "get_chart!/1 returns the chart with given id" do
      chart = chart_fixture()
      assert Charts.get_chart!(chart.id) == chart
    end

    test "create_chart/1 with valid data creates a chart" do
      assert {:ok, %Chart{} = chart} = Charts.create_chart(@valid_attrs)
      assert chart.name == "some name"
      assert chart.option == %{}
      assert chart.type == "some type"
      assert chart.type_name == "some type_name"
    end

    test "create_chart/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Charts.create_chart(@invalid_attrs)
    end

    test "update_chart/2 with valid data updates the chart" do
      chart = chart_fixture()
      assert {:ok, %Chart{} = chart} = Charts.update_chart(chart, @update_attrs)
      assert chart.name == "some updated name"
      assert chart.option == %{}
      assert chart.type == "some updated type"
      assert chart.type_name == "some updated type_name"
    end

    test "update_chart/2 with invalid data returns error changeset" do
      chart = chart_fixture()
      assert {:error, %Ecto.Changeset{}} = Charts.update_chart(chart, @invalid_attrs)
      assert chart == Charts.get_chart!(chart.id)
    end

    test "delete_chart/1 deletes the chart" do
      chart = chart_fixture()
      assert {:ok, %Chart{}} = Charts.delete_chart(chart)
      assert_raise Ecto.NoResultsError, fn -> Charts.get_chart!(chart.id) end
    end

    test "change_chart/1 returns a chart changeset" do
      chart = chart_fixture()
      assert %Ecto.Changeset{} = Charts.change_chart(chart)
    end
  end
end

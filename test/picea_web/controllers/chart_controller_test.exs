defmodule PiceaWeb.ChartControllerTest do
  use PiceaWeb.ConnCase

  alias Picea.Charts
  alias Picea.Charts.Chart

  @create_attrs %{
    name: "some name",
    option: %{},
    type: "some type",
    type_name: "some type_name"
  }
  @update_attrs %{
    name: "some updated name",
    option: %{},
    type: "some updated type",
    type_name: "some updated type_name"
  }
  @invalid_attrs %{name: nil, option: nil, type: nil, type_name: nil}

  def fixture(:chart) do
    {:ok, chart} = Charts.create_chart(@create_attrs)
    chart
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all charts", %{conn: conn} do
      conn = get(conn, Routes.chart_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create chart" do
    test "renders chart when data is valid", %{conn: conn} do
      conn = post(conn, Routes.chart_path(conn, :create), chart: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.chart_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some name",
               "option" => {},
               "type" => "some type",
               "type_name" => "some type_name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.chart_path(conn, :create), chart: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update chart" do
    setup [:create_chart]

    test "renders chart when data is valid", %{conn: conn, chart: %Chart{id: id} = chart} do
      conn = put(conn, Routes.chart_path(conn, :update, chart), chart: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.chart_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some updated name",
               "option" => {},
               "type" => "some updated type",
               "type_name" => "some updated type_name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, chart: chart} do
      conn = put(conn, Routes.chart_path(conn, :update, chart), chart: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete chart" do
    setup [:create_chart]

    test "deletes chosen chart", %{conn: conn, chart: chart} do
      conn = delete(conn, Routes.chart_path(conn, :delete, chart))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.chart_path(conn, :show, chart))
      end
    end
  end

  defp create_chart(_) do
    chart = fixture(:chart)
    {:ok, chart: chart}
  end
end

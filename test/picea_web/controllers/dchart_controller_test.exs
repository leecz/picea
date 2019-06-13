defmodule PiceaWeb.DchartControllerTest do
  use PiceaWeb.ConnCase

  alias Picea.Charts
  alias Picea.Charts.Dchart

  @create_attrs %{
    data: %{},
    name: "some name",
    option: %{},
    user_id: 42
  }
  @update_attrs %{
    data: %{},
    name: "some updated name",
    option: %{},
    user_id: 43
  }
  @invalid_attrs %{data: nil, name: nil, option: nil, user_id: nil}

  def fixture(:dchart) do
    {:ok, dchart} = Charts.create_dchart(@create_attrs)
    dchart
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all dcharts", %{conn: conn} do
      conn = get(conn, Routes.dchart_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create dchart" do
    test "renders dchart when data is valid", %{conn: conn} do
      conn = post(conn, Routes.dchart_path(conn, :create), dchart: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.dchart_path(conn, :show, id))

      assert %{
               "id" => id,
               "data" => {},
               "name" => "some name",
               "option" => {},
               "user_id" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.dchart_path(conn, :create), dchart: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update dchart" do
    setup [:create_dchart]

    test "renders dchart when data is valid", %{conn: conn, dchart: %Dchart{id: id} = dchart} do
      conn = put(conn, Routes.dchart_path(conn, :update, dchart), dchart: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.dchart_path(conn, :show, id))

      assert %{
               "id" => id,
               "data" => {},
               "name" => "some updated name",
               "option" => {},
               "user_id" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, dchart: dchart} do
      conn = put(conn, Routes.dchart_path(conn, :update, dchart), dchart: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete dchart" do
    setup [:create_dchart]

    test "deletes chosen dchart", %{conn: conn, dchart: dchart} do
      conn = delete(conn, Routes.dchart_path(conn, :delete, dchart))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.dchart_path(conn, :show, dchart))
      end
    end
  end

  defp create_dchart(_) do
    dchart = fixture(:dchart)
    {:ok, dchart: dchart}
  end
end

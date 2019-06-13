defmodule PiceaWeb.DchartController do
  use PiceaWeb, :controller

  alias Picea.Charts
  alias Picea.Charts.Dchart

  action_fallback PiceaWeb.FallbackController

  def index(conn, _params) do
    user = Picea.Guardian.Plug.current_resource(conn)
    dcharts = Charts.list_dcharts(user)
    render(conn, "index.json", dcharts: dcharts)
  end

  def create(conn, %{"dchart" => dchart_params}) do
    user = Picea.Guardian.Plug.current_resource(conn)

    with {:ok, %Dchart{} = dchart} <-
           Charts.create_dchart(Map.merge(dchart_params, %{"user_id" => user.id})) do
      conn
      |> put_status(:ok)
      |> put_resp_header("location", Routes.dchart_path(conn, :show, dchart))
      |> render("show.json", dchart: dchart)
    end
  end

  def show(conn, %{"id" => id}) do
    dchart = Charts.get_dchart!(id)
    render(conn, "show.json", dchart: dchart)
  end

  def update(conn, %{"id" => id, "dchart" => dchart_params}) do
    dchart = Charts.get_dchart!(id)

    with {:ok, %Dchart{} = dchart} <- Charts.update_dchart(dchart, dchart_params) do
      render(conn, "show.json", dchart: dchart)
    end
  end

  def delete(conn, %{"id" => id}) do
    dchart = Charts.get_dchart!(id)

    with {:ok, %Dchart{}} <- Charts.delete_dchart(dchart) do
      send_resp(conn, :no_content, "")
    end
  end
end

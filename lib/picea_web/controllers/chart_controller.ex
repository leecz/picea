defmodule PiceaWeb.ChartController do
  use PiceaWeb, :controller

  alias Picea.Charts
  alias Picea.Charts.Chart

  action_fallback PiceaWeb.FallbackController

  def index(conn, _params) do
    user = Picea.Guardian.Plug.current_resource(conn)
    charts = Charts.list_charts(user)
    render(conn, "index.json", charts: charts)
  end

  def create(conn, %{"chart" => chart_params}) do
    user = Picea.Guardian.Plug.current_resource(conn)

    with {:ok, %Chart{} = chart} <-
           Charts.create_chart(Map.merge(chart_params, %{"user_id" => user.id})) do
      conn
      |> put_status(:ok)
      |> put_resp_header("location", Routes.chart_path(conn, :show, chart))
      |> render("show.json", chart: chart)
    end
  end

  def show(conn, %{"id" => id}) do
    chart = Charts.get_chart!(id)
    render(conn, "show.json", chart: chart)
  end

  def update(conn, %{"id" => id, "chart" => chart_params}) do
    chart = Charts.get_chart!(id)

    with {:ok, %Chart{} = chart} <- Charts.update_chart(chart, chart_params) do
      render(conn, "show.json", chart: chart)
    end
  end

  def delete(conn, %{"id" => id}) do
    chart = Charts.get_chart!(id)

    with {:ok, %Chart{}} <- Charts.delete_chart(chart) do
      send_resp(conn, :no_content, "")
    end
  end
end

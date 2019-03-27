defmodule PiceaWeb.ChartView do
  use PiceaWeb, :view
  alias PiceaWeb.ChartView

  def render("index.json", %{charts: charts}) do
    %{data: render_many(charts, ChartView, "chart.json")}
  end

  def render("show.json", %{chart: chart}) do
    %{data: render_one(chart, ChartView, "chart.json")}
  end

  def render("chart.json", %{chart: chart}) do
    %{
      id: chart.id,
      name: chart.name,
      type: chart.type,
      type_name: chart.type_name,
      option: chart.option,
      theme: chart.theme
    }
  end
end

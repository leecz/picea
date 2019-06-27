defmodule PiceaWeb.DchartView do
  use PiceaWeb, :view
  alias PiceaWeb.DchartView

  def render("index.json", %{dcharts: dcharts}) do
    %{data: render_many(dcharts, DchartView, "dchart.json")}
  end

  def render("show.json", %{dchart: dchart}) do
    %{data: render_one(dchart, DchartView, "dchart.json")}
  end

  def render("dchart.json", %{dchart: dchart}) do
    %{
      id: dchart.id,
      name: dchart.name,
      option: dchart.option,
      data: dchart.data,
      type: dchart.type,
      thumb: dchart.thumb,
      user_id: dchart.user_id
    }
  end
end

defmodule PiceaWeb.SheetController do
  use PiceaWeb, :controller

  alias Picea.Datasheet
  alias Picea.Datasheet.Sheet

  action_fallback PiceaWeb.FallbackController

  def index(conn, _params) do
    user = Picea.Guardian.Plug.current_resource(conn)
    sheets = Datasheet.list_sheets(user)
    render(conn, "index.json", sheets: sheets)
  end

  def create(conn, %{"sheet" => sheet_params}) do
    user = Picea.Guardian.Plug.current_resource(conn)

    with {:ok, %Sheet{} = sheet} <-
           Datasheet.create_sheet(Map.merge(sheet_params, %{"user_id" => user.id})) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.sheet_path(conn, :show, sheet))
      |> render("show.json", sheet: sheet)
    end
  end

  def show(conn, %{"id" => id}) do
    sheet = Datasheet.get_sheet!(id)
    render(conn, "show.json", sheet: sheet)
  end

  def update(conn, %{"id" => id, "sheet" => sheet_params}) do
    sheet = Datasheet.get_sheet!(id)

    with {:ok, %Sheet{} = sheet} <- Datasheet.update_sheet(sheet, sheet_params) do
      render(conn, "show.json", sheet: sheet)
    end
  end

  def delete(conn, %{"id" => id}) do
    sheet = Datasheet.get_sheet!(id)

    with {:ok, %Sheet{}} <- Datasheet.delete_sheet(sheet) do
      send_resp(conn, :no_content, "")
    end
  end
end

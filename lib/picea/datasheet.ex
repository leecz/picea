defmodule Picea.Datasheet do
  @moduledoc """
  The Datasheet context.
  """

  alias Picea.Accounts.User

  import Ecto.Query, warn: false
  alias Picea.Repo

  alias Picea.Datasheet.Sheet

  def list_sheets(%User{} = user) do
    Repo.all(
      from s in Sheet,
        where: s.user_id == ^user.id
    )
  end

  def list_sheets do
    Repo.all(Sheet)
  end

  def get_sheet!(id), do: Repo.get!(Sheet, id)

  def create_sheet(attrs \\ %{}) do
    %Sheet{}
    |> Sheet.changeset(attrs)
    |> Repo.insert()
  end

  def update_sheet(%Sheet{} = sheet, attrs) do
    sheet
    |> Sheet.changeset(attrs)
    |> Repo.update()
  end

  def delete_sheet(%Sheet{} = sheet) do
    Repo.delete(sheet)
  end

  def change_sheet(%Sheet{} = sheet) do
    Sheet.changeset(sheet, %{})
  end
end

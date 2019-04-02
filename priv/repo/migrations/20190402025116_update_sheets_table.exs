defmodule Picea.Repo.Migrations.UpdateSheetsTable do
  use Ecto.Migration

  def change do
    alter table(:sheets) do
      add :data_type, :string, default: "sheet"
    end
  end
end

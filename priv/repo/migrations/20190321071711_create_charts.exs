defmodule Picea.Repo.Migrations.CreateCharts do
  use Ecto.Migration

  def change do
    create table(:charts) do
      add :user_id, references(:users, on_delete: :delete_all)
      add :name, :string
      add :type, :string
      add :type_name, :string
      add :theme, :string
      add :option, :map

      timestamps()
    end
  end
end

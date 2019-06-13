defmodule Picea.Repo.Migrations.CreateDcharts do
  use Ecto.Migration

  def change do
    create table(:dcharts) do
      add :name, :string
      add :option, :map
      add :data, :map
      add :type, :string
      add :user_id, references(:users, on_delete: :delete_all)
      timestamps()
    end

  end
end

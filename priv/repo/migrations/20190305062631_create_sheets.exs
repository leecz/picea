defmodule Picea.Repo.Migrations.CreateSheets do
  use Ecto.Migration

  def change do
    create table(:sheets) do
      add :name, :string
      add :data, :map
      add :user_id, references(:users, on_delete: :delete_all)

      timestamps()
    end
  end
end

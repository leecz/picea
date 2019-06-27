defmodule Picea.Repo.Migrations.AddThumbToDcharts do
  use Ecto.Migration

  def change do
    alter table(:dcharts) do
      add :thumb, :text
    end
  end
end

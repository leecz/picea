defmodule Picea.Datasheet.Sheet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sheets" do
    field :data, :map
    field :name, :string
    field :data_type, :string, default: "sheet"
    belongs_to(:user, Picea.Accounts.User)

    timestamps()
  end

  @doc false
  def changeset(sheet, attrs) do
    sheet
    |> cast(attrs, [:name, :data, :user_id, :data_type])
    |> validate_required([:name, :data, :user_id])
    |> validate_inclusion(:data_type, ["sheet", "json"])
  end
end

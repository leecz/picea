defmodule Picea.Datasheet.Sheet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sheets" do
    field :data, :map
    field :name, :string
    belongs_to(:user, Picea.Accounts.User)

    timestamps()
  end

  @doc false
  def changeset(sheet, attrs) do
    sheet
    |> cast(attrs, [:name, :data])
    |> validate_required([:name, :data])
  end
end

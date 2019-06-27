defmodule Picea.Charts.Dchart do
  use Ecto.Schema
  import Ecto.Changeset


  schema "dcharts" do
    field :data, :map
    field :name, :string
    field :option, :map
    field :type, :string
    field :thumb, :string
    belongs_to(:user, Picea.Accounts.User)
    timestamps()
  end

  @doc false
  def changeset(dchart, attrs) do
    dchart
    |> cast(attrs, [:name, :option, :data, :type, :user_id, :thumb])
    |> validate_required([:name, :option, :data, :type, :user_id])
  end
end

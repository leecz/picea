defmodule Picea.Charts.Chart do
  use Ecto.Schema
  import Ecto.Changeset

  schema "charts" do
    field :name, :string
    field :option, :map
    field :type, :string
    field :type_name, :string
    field :theme, :string
    belongs_to(:user, Picea.Accounts.User)

    timestamps()
  end

  @doc false
  def changeset(chart, attrs) do
    chart
    |> cast(attrs, [:name, :type, :type_name, :option, :user_id, :theme])
    |> validate_required([:name, :type, :type_name, :option, :user_id])
  end
end

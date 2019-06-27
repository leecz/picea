defmodule Picea.Charts do
  @moduledoc """
  The Charts context.
  """

  import Ecto.Query, warn: false
  alias Picea.Repo

  alias Picea.Charts.Chart
  alias Picea.Accounts.User

  @doc """
  Returns the list of charts.

  ## Examples

      iex> list_charts()
      [%Chart{}, ...]

  """
  def list_charts(%User{} = user) do
    Repo.all(from c in Chart, where: c.user_id == ^user.id)
  end

  def list_charts do
    Repo.all(Chart)
  end

  @doc """
  Gets a single chart.

  Raises `Ecto.NoResultsError` if the Chart does not exist.

  ## Examples

      iex> get_chart!(123)
      %Chart{}

      iex> get_chart!(456)
      ** (Ecto.NoResultsError)

  """
  def get_chart!(id), do: Repo.get!(Chart, id)

  @doc """
  Creates a chart.

  ## Examples

      iex> create_chart(%{field: value})
      {:ok, %Chart{}}

      iex> create_chart(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_chart(attrs \\ %{}) do
    %Chart{}
    |> Chart.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a chart.

  ## Examples

      iex> update_chart(chart, %{field: new_value})
      {:ok, %Chart{}}

      iex> update_chart(chart, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_chart(%Chart{} = chart, attrs) do
    chart
    |> Chart.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Chart.

  ## Examples

      iex> delete_chart(chart)
      {:ok, %Chart{}}

      iex> delete_chart(chart)
      {:error, %Ecto.Changeset{}}

  """
  def delete_chart(%Chart{} = chart) do
    Repo.delete(chart)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking chart changes.

  ## Examples

      iex> change_chart(chart)
      %Ecto.Changeset{source: %Chart{}}

  """
  def change_chart(%Chart{} = chart) do
    Chart.changeset(chart, %{})
  end

  alias Picea.Charts.Dchart

  @doc """
  Returns the list of dcharts.

  ## Examples

      iex> list_dcharts()
      [%Dchart{}, ...]

  """
  def list_dcharts(%User{} = user) do
    Repo.all(from c in Dchart, where: c.user_id == ^user.id)
  end

  def list_dcharts do
    Repo.all(Dchart)
  end

  @doc """
  Gets a single dchart.

  Raises `Ecto.NoResultsError` if the Dchart does not exist.

  ## Examples

      iex> get_dchart!(123)
      %Dchart{}

      iex> get_dchart!(456)
      ** (Ecto.NoResultsError)

  """
  def get_dchart!(id), do: Repo.get!(Dchart, id)

  @doc """
  Creates a dchart.

  ## Examples

      iex> create_dchart(%{field: value})
      {:ok, %Dchart{}}

      iex> create_dchart(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_dchart(attrs \\ %{}) do
    %Dchart{}
    |> Dchart.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a dchart.

  ## Examples

      iex> update_dchart(dchart, %{field: new_value})
      {:ok, %Dchart{}}

      iex> update_dchart(dchart, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_dchart(%Dchart{} = dchart, attrs) do
    dchart
    |> Dchart.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Dchart.

  ## Examples

      iex> delete_dchart(dchart)
      {:ok, %Dchart{}}

      iex> delete_dchart(dchart)
      {:error, %Ecto.Changeset{}}

  """
  def delete_dchart(%Dchart{} = dchart) do
    Repo.delete(dchart)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking dchart changes.

  ## Examples

      iex> change_dchart(dchart)
      %Ecto.Changeset{source: %Dchart{}}

  """
  def change_dchart(%Dchart{} = dchart) do
    Dchart.changeset(dchart, %{})
  end
end

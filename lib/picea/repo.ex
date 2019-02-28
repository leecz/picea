defmodule Picea.Repo do
  use Ecto.Repo,
    otp_app: :picea,
    adapter: Ecto.Adapters.Postgres
end

defmodule Picea.Auth do
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _) do
    user = Picea.Guardian.Plug.current_resource(conn)
    put_current_user(conn, user)
  end

  def put_current_user(conn, user) do
    conn
    |> assign(:current_user, user)
  end
end

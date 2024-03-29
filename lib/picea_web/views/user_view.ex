defmodule PiceaWeb.UserView do
  use PiceaWeb, :view
  alias PiceaWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id, username: user.username, inserted_at: user.inserted_at}
  end

  def render("jwt.json", %{user: user}) do
    %{
      id: user.id,
      token: user.token,
      username: user.username
    }
  end
end

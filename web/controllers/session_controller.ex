defmodule MyStuffs.SessionController do
  use MyStuffs.Web, :controller

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, %{"session" => session_params}) do
    case MyStuffs.Session.login(session_params, MyStuffs.Repo) do
      {:ok, user} ->
        conn
        |> put_session(:current_user, user.id)
        |> put_flash(:info, "Logged In")
        |> redirect(to: "/")
      :error ->
        conn
        |> put_flash(:error, "Wrong email or password")
        |> render("new.html")
    end
  end
end

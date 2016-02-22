defmodule MyStuffs.Plugs.Unauthenticate do
  import Plug.Conn
  import MyStuffs.Router.Helpers
  import Phoenix.Controller

  def init(default), do: default

  def call(conn, default) do
    current_user = get_session(conn, :current_user)

    if current_user do
      conn
      |> put_flash(:error, "You are already logged in")
      |> redirect(to: "/")
      |> halt
    else
      conn
    end
  end
end

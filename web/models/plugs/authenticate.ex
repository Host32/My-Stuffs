defmodule MyStuffs.Plugs.Authenticate do
  import Plug.Conn
  import MyStuffs.Router.Helpers
  import Phoenix.Controller

  def init(default), do: default

  def call(conn, _default) do
    current_user = get_session(conn, :current_user)

    if current_user do
      put_session(conn, :current_user, current_user)
    else
      conn
      |> put_flash(:error, "You need to be signed in to view this page")
      |> redirect(to: session_path(conn, :new))
    end
  end
end

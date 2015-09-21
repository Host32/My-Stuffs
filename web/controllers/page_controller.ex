defmodule MyStuffs.PageController do
  use MyStuffs.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end

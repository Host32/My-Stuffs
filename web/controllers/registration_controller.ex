defmodule MyStuffs.RegistrationController do
  use MyStuffs.Web, :controller
  alias MyStuffs.User

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, changeset: changeset
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)

    if changeset.valid? do
      user = MyStuffs.Registration.create(changeset, MyStuffs.Repo)
      conn
      |> put_flash(:success, "Your account was created")
      |> redirect(to: "/")
    else
      conn
      |> put_flash(:info, "Unable to create account")
      |> render("new.html", changeset: changeset)
    end
  end
end

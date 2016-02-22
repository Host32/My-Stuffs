defmodule MyStuffs.BookController do
  use MyStuffs.Web, :controller

  alias MyStuffs.Stuff
  alias MyStuffs.Book

  plug :scrub_params, "stuff" when action in [:create, :update]
  plug MyStuffs.Plugs.Authenticate when action in [:new, :create, :edit, :delete, :update]

  def index(conn, _params) do
    stuffs = Stuff
      |> Book.Query.with_genres
      |> Book.Query.with_comments
      |> Book.Query.with_parental_rating
      |> Book.Query.with_images
      |> Book.Query.with_writers
      |> Book.Query.all
    render(conn, "index.html", stuffs: stuffs)
  end

  def new(conn, _params) do
    changeset = Stuff.book_changeset(%Stuff{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"stuff" => stuff_params}) do
    changeset = Stuff.book_changeset(%Stuff{}, stuff_params)

    case Repo.insert(changeset) do
      {:ok, _stuff} ->
        conn
        |> put_flash(:info, "Book created successfully.")
        |> redirect(to: book_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    stuff = Stuff
      |> Book.Query.with_id(id)
      |> Book.Query.with_genres
      |> Book.Query.with_comments
      |> Book.Query.with_parental_rating
      |> Book.Query.with_images
      |> Book.Query.with_writers
      |> Book.Query.one!

    render(conn, "show.html", stuff: stuff)
  end

  def edit(conn, %{"id" => id}) do
    stuff = Book.Query.get!(Stuff, id)
    changeset = Stuff.book_changeset(stuff)
    render(conn, "edit.html", stuff: stuff, changeset: changeset)
  end

  def update(conn, %{"id" => id, "stuff" => stuff_params}) do
    stuff = Book.Query.get!(id)
    changeset = Stuff.book_changeset(stuff, stuff_params)

    case Repo.update(changeset) do
      {:ok, stuff} ->
        conn
        |> put_flash(:info, "Book updated successfully.")
        |> redirect(to: book_path(conn, :show, stuff))
      {:error, changeset} ->
        render(conn, "edit.html", stuff: stuff, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    stuff = Book.Query.get!(id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(stuff)

    conn
    |> put_flash(:info, "Book deleted successfully.")
    |> redirect(to: book_path(conn, :index))
  end
end

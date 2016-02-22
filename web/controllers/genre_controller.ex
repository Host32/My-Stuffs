defmodule MyStuffs.GenreController do
  use MyStuffs.Web, :controller

  alias MyStuffs.Genre

  plug :scrub_params, "genre" when action in [:create, :update]
  plug MyStuffs.Plugs.Authenticate when action in [:new, :create, :edit, :delete, :update]

  def index(conn, _params) do
    genres = Repo.all(Genre)
    render(conn, "index.html", genres: genres)
  end

  def new(conn, _params) do
    changeset = Genre.changeset(%Genre{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"genre" => genre_params}) do
    changeset = Genre.changeset(%Genre{}, genre_params)

    case Repo.insert(changeset) do
      {:ok, _genre} ->
        conn
        |> put_flash(:info, "Genre created successfully.")
        |> redirect(to: genre_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    genre = Repo.get!(Genre, id)
    render(conn, "show.html", genre: genre)
  end

  def edit(conn, %{"id" => id}) do
    genre = Repo.get!(Genre, id)
    changeset = Genre.changeset(genre)
    render(conn, "edit.html", genre: genre, changeset: changeset)
  end

  def update(conn, %{"id" => id, "genre" => genre_params}) do
    genre = Repo.get!(Genre, id)
    changeset = Genre.changeset(genre, genre_params)

    case Repo.update(changeset) do
      {:ok, genre} ->
        conn
        |> put_flash(:info, "Genre updated successfully.")
        |> redirect(to: genre_path(conn, :show, genre))
      {:error, changeset} ->
        render(conn, "edit.html", genre: genre, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    genre = Repo.get!(Genre, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(genre)

    conn
    |> put_flash(:info, "Genre deleted successfully.")
    |> redirect(to: genre_path(conn, :index))
  end
end

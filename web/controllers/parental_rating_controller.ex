defmodule MyStuffs.ParentalRatingController do
  use MyStuffs.Web, :controller

  alias MyStuffs.ParentalRating

  plug :scrub_params, "parental_rating" when action in [:create, :update]

  def index(conn, _params) do
    parental_ratings = Repo.all(ParentalRating)
    render(conn, "index.html", parental_ratings: parental_ratings)
  end

  def new(conn, _params) do
    changeset = ParentalRating.changeset(%ParentalRating{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"parental_rating" => parental_rating_params}) do
    changeset = ParentalRating.changeset(%ParentalRating{}, parental_rating_params)

    case Repo.insert(changeset) do
      {:ok, _parental_rating} ->
        conn
        |> put_flash(:info, "Parental rating created successfully.")
        |> redirect(to: parental_rating_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    parental_rating = Repo.get!(ParentalRating, id)
    render(conn, "show.html", parental_rating: parental_rating)
  end

  def edit(conn, %{"id" => id}) do
    parental_rating = Repo.get!(ParentalRating, id)
    changeset = ParentalRating.changeset(parental_rating)
    render(conn, "edit.html", parental_rating: parental_rating, changeset: changeset)
  end

  def update(conn, %{"id" => id, "parental_rating" => parental_rating_params}) do
    parental_rating = Repo.get!(ParentalRating, id)
    changeset = ParentalRating.changeset(parental_rating, parental_rating_params)

    case Repo.update(changeset) do
      {:ok, parental_rating} ->
        conn
        |> put_flash(:info, "Parental rating updated successfully.")
        |> redirect(to: parental_rating_path(conn, :show, parental_rating))
      {:error, changeset} ->
        render(conn, "edit.html", parental_rating: parental_rating, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    parental_rating = Repo.get!(ParentalRating, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(parental_rating)

    conn
    |> put_flash(:info, "Parental rating deleted successfully.")
    |> redirect(to: parental_rating_path(conn, :index))
  end
end

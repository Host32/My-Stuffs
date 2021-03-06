defmodule MyStuffs.SeasonController do
  use MyStuffs.Web, :controller

  alias MyStuffs.Season

  plug :scrub_params, "season" when action in [:create, :update]
  plug MyStuffs.Plugs.Authenticate when action in [:new, :create, :edit, :delete, :update]

  def index(conn, _params) do
    seasons = Repo.all(Season)
    render(conn, "index.html", seasons: seasons)
  end

  def new(conn, _params) do
    changeset = Season.changeset(%Season{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"season" => season_params}) do
    changeset = Season.changeset(%Season{}, season_params)

    case Repo.insert(changeset) do
      {:ok, _season} ->
        conn
        |> put_flash(:info, "Season created successfully.")
        |> redirect(to: season_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    season = Repo.get!(Season, id)
    render(conn, "show.html", season: season)
  end

  def edit(conn, %{"id" => id}) do
    season = Repo.get!(Season, id)
    changeset = Season.changeset(season)
    render(conn, "edit.html", season: season, changeset: changeset)
  end

  def update(conn, %{"id" => id, "season" => season_params}) do
    season = Repo.get!(Season, id)
    changeset = Season.changeset(season, season_params)

    case Repo.update(changeset) do
      {:ok, season} ->
        conn
        |> put_flash(:info, "Season updated successfully.")
        |> redirect(to: season_path(conn, :show, season))
      {:error, changeset} ->
        render(conn, "edit.html", season: season, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    season = Repo.get!(Season, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(season)

    conn
    |> put_flash(:info, "Season deleted successfully.")
    |> redirect(to: season_path(conn, :index))
  end
end

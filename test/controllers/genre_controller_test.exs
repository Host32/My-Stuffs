defmodule MyStuffs.GenreControllerTest do
  use MyStuffs.ConnCase

  alias MyStuffs.Genre
  @valid_attrs %{title: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, genre_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing genres"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, genre_path(conn, :new)
    assert html_response(conn, 200) =~ "New genre"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, genre_path(conn, :create), genre: @valid_attrs
    assert redirected_to(conn) == genre_path(conn, :index)
    assert Repo.get_by(Genre, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, genre_path(conn, :create), genre: @invalid_attrs
    assert html_response(conn, 200) =~ "New genre"
  end

  test "shows chosen resource", %{conn: conn} do
    genre = Repo.insert! %Genre{}
    conn = get conn, genre_path(conn, :show, genre)
    assert html_response(conn, 200) =~ "Show genre"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, genre_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    genre = Repo.insert! %Genre{}
    conn = get conn, genre_path(conn, :edit, genre)
    assert html_response(conn, 200) =~ "Edit genre"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    genre = Repo.insert! %Genre{}
    conn = put conn, genre_path(conn, :update, genre), genre: @valid_attrs
    assert redirected_to(conn) == genre_path(conn, :show, genre)
    assert Repo.get_by(Genre, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    genre = Repo.insert! %Genre{}
    conn = put conn, genre_path(conn, :update, genre), genre: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit genre"
  end

  test "deletes chosen resource", %{conn: conn} do
    genre = Repo.insert! %Genre{}
    conn = delete conn, genre_path(conn, :delete, genre)
    assert redirected_to(conn) == genre_path(conn, :index)
    refute Repo.get(Genre, genre.id)
  end
end

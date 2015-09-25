defmodule MyStuffs.ArtistControllerTest do
  use MyStuffs.ConnCase

  alias MyStuffs.Artist
  @valid_attrs %{bio: "some content", birth: "2010-04-17", jobs: "some content", name: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, artist_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing artists"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, artist_path(conn, :new)
    assert html_response(conn, 200) =~ "New artist"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, artist_path(conn, :create), artist: @valid_attrs
    assert redirected_to(conn) == artist_path(conn, :index)
    assert Repo.get_by(Artist, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, artist_path(conn, :create), artist: @invalid_attrs
    assert html_response(conn, 200) =~ "New artist"
  end

  test "shows chosen resource", %{conn: conn} do
    artist = Repo.insert! %Artist{}
    conn = get conn, artist_path(conn, :show, artist)
    assert html_response(conn, 200) =~ "Show artist"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, artist_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    artist = Repo.insert! %Artist{}
    conn = get conn, artist_path(conn, :edit, artist)
    assert html_response(conn, 200) =~ "Edit artist"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    artist = Repo.insert! %Artist{}
    conn = put conn, artist_path(conn, :update, artist), artist: @valid_attrs
    assert redirected_to(conn) == artist_path(conn, :show, artist)
    assert Repo.get_by(Artist, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    artist = Repo.insert! %Artist{}
    conn = put conn, artist_path(conn, :update, artist), artist: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit artist"
  end

  test "deletes chosen resource", %{conn: conn} do
    artist = Repo.insert! %Artist{}
    conn = delete conn, artist_path(conn, :delete, artist)
    assert redirected_to(conn) == artist_path(conn, :index)
    refute Repo.get(Artist, artist.id)
  end
end

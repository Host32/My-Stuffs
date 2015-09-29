defmodule MyStuffs.ParentalRatingControllerTest do
  use MyStuffs.ConnCase

  alias MyStuffs.ParentalRating
  @valid_attrs %{minimum_age: 42, title: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, parental_rating_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing parental ratings"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, parental_rating_path(conn, :new)
    assert html_response(conn, 200) =~ "New parental rating"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, parental_rating_path(conn, :create), parental_rating: @valid_attrs
    assert redirected_to(conn) == parental_rating_path(conn, :index)
    assert Repo.get_by(ParentalRating, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, parental_rating_path(conn, :create), parental_rating: @invalid_attrs
    assert html_response(conn, 200) =~ "New parental rating"
  end

  test "shows chosen resource", %{conn: conn} do
    parental_rating = Repo.insert! %ParentalRating{}
    conn = get conn, parental_rating_path(conn, :show, parental_rating)
    assert html_response(conn, 200) =~ "Show parental rating"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, parental_rating_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    parental_rating = Repo.insert! %ParentalRating{}
    conn = get conn, parental_rating_path(conn, :edit, parental_rating)
    assert html_response(conn, 200) =~ "Edit parental rating"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    parental_rating = Repo.insert! %ParentalRating{}
    conn = put conn, parental_rating_path(conn, :update, parental_rating), parental_rating: @valid_attrs
    assert redirected_to(conn) == parental_rating_path(conn, :show, parental_rating)
    assert Repo.get_by(ParentalRating, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    parental_rating = Repo.insert! %ParentalRating{}
    conn = put conn, parental_rating_path(conn, :update, parental_rating), parental_rating: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit parental rating"
  end

  test "deletes chosen resource", %{conn: conn} do
    parental_rating = Repo.insert! %ParentalRating{}
    conn = delete conn, parental_rating_path(conn, :delete, parental_rating)
    assert redirected_to(conn) == parental_rating_path(conn, :index)
    refute Repo.get(ParentalRating, parental_rating.id)
  end
end

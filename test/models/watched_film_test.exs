defmodule MyStuffs.WatchedFilmTest do
  use MyStuffs.ModelCase

  alias MyStuffs.WatchedFilm

  @valid_attrs %{date: "2010-04-17", notes: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = WatchedFilm.changeset(%WatchedFilm{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = WatchedFilm.changeset(%WatchedFilm{}, @invalid_attrs)
    refute changeset.valid?
  end
end

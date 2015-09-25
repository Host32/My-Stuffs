defmodule MyStuffs.ArtistTest do
  use MyStuffs.ModelCase

  alias MyStuffs.Artist

  @valid_attrs %{bio: "some content", birth: "2010-04-17", jobs: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Artist.changeset(%Artist{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Artist.changeset(%Artist{}, @invalid_attrs)
    refute changeset.valid?
  end
end

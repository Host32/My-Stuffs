defmodule MyStuffs.StuffGenreTest do
  use MyStuffs.ModelCase

  alias MyStuffs.StuffGenre

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = StuffGenre.changeset(%StuffGenre{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = StuffGenre.changeset(%StuffGenre{}, @invalid_attrs)
    refute changeset.valid?
  end
end

defmodule MyStuffs.GenreTest do
  use MyStuffs.ModelCase

  alias MyStuffs.Genre

  @valid_attrs %{title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Genre.changeset(%Genre{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Genre.changeset(%Genre{}, @invalid_attrs)
    refute changeset.valid?
  end
end
defmodule MyStuffs.StuffTest do
  use MyStuffs.ModelCase

  alias MyStuffs.Stuff

  @valid_attrs %{duration: "14:00:00", pages: 42, release_date: "2010-04-17", short_description: "some content", sinopsis: "some content", title: "some content", type: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Stuff.changeset(%Stuff{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Stuff.changeset(%Stuff{}, @invalid_attrs)
    refute changeset.valid?
  end
end

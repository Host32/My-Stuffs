defmodule MyStuffs.SeasonTest do
  use MyStuffs.ModelCase

  alias MyStuffs.Season

  @valid_attrs %{number: 42, release_date: "2010-04-17"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Season.changeset(%Season{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Season.changeset(%Season{}, @invalid_attrs)
    refute changeset.valid?
  end
end

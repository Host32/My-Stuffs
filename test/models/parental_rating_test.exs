defmodule MyStuffs.ParentalRatingTest do
  use MyStuffs.ModelCase

  alias MyStuffs.ParentalRating

  @valid_attrs %{minimum_age: 42, title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = ParentalRating.changeset(%ParentalRating{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = ParentalRating.changeset(%ParentalRating{}, @invalid_attrs)
    refute changeset.valid?
  end
end

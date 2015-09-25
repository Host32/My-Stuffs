defmodule MyStuffs.ImageTest do
  use MyStuffs.ModelCase

  alias MyStuffs.Image

  @valid_attrs %{assoc_id: 42, file_name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Image.changeset(%Image{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Image.changeset(%Image{}, @invalid_attrs)
    refute changeset.valid?
  end
end

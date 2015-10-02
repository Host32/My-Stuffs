defmodule MyStuffs.BookWriterTest do
  use MyStuffs.ModelCase

  alias MyStuffs.BookWriter

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = BookWriter.changeset(%BookWriter{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = BookWriter.changeset(%BookWriter{}, @invalid_attrs)
    refute changeset.valid?
  end
end

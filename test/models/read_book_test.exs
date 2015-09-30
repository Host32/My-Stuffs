defmodule MyStuffs.ReadBookTest do
  use MyStuffs.ModelCase

  alias MyStuffs.ReadBook

  @valid_attrs %{conclusion_read_date: "2010-04-17", current_page: 42, last_read_date: "2010-04-17", notes: "some content", start_read_date: "2010-04-17"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = ReadBook.changeset(%ReadBook{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = ReadBook.changeset(%ReadBook{}, @invalid_attrs)
    refute changeset.valid?
  end
end

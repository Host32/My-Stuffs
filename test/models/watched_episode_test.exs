defmodule MyStuffs.WatchedEpisodeTest do
  use MyStuffs.ModelCase

  alias MyStuffs.WatchedEpisode

  @valid_attrs %{date: "2010-04-17", notes: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = WatchedEpisode.changeset(%WatchedEpisode{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = WatchedEpisode.changeset(%WatchedEpisode{}, @invalid_attrs)
    refute changeset.valid?
  end
end

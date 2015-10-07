defmodule MyStuffs.Rating do
  use MyStuffs.Web, :model
  use Ecto.Model.Callbacks

  alias MyStuffs.Stuff
  alias MyStuffs.Repo

  schema "ratings" do
    field :stars, :integer
    belongs_to :user, MyStuffs.User
    belongs_to :stuff, MyStuffs.Stuff

    timestamps
  end

  after_insert :increase_rating_count
  before_update :update_rating_stars

  @required_fields ~w(stars stuff_id)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  def increase_rating_count(%{model: %{stuff_id: stuff_id, stars: stars}} = changeset) do
    stuff = Repo.get!(Stuff, stuff_id)
    stuff_changeset = Stuff.rating_changeset(stuff, %{"rating_count" => stuff.rating_count + 1, "rating_stars" => stuff.rating_stars + stars})

    case Repo.update(stuff_changeset) do
      {:ok, _stuff} ->
        changeset
      {:error, _changeset} ->
        :error
    end
  end

  def update_rating_stars(%{model: %{stuff_id: stuff_id, stars: old_stars}, params: %{"stars" => new_stars}} = changeset) do
    stuff = Repo.get!(Stuff, stuff_id)
    stars = stuff.rating_stars - old_stars + new_stars
    stuff_changeset = Stuff.rating_changeset(stuff, %{"rating_stars" => stars})

    case Repo.update(stuff_changeset) do
      {:ok, _stuff} ->
        changeset
      {:error, _changeset} ->
        :error
    end
  end
end

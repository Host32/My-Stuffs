defmodule MyStuffs.WatchedFilm do
  use MyStuffs.Web, :model

  schema "watched_films" do
    field :date, Ecto.Date
    field :notes, :string
    belongs_to :stuff, MyStuffs.Stuff
    belongs_to :user, MyStuffs.User

    timestamps
  end

  @required_fields ~w(date notes)
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
end

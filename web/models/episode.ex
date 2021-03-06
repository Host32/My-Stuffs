defmodule MyStuffs.Episode do
  use MyStuffs.Web, :model

  schema "episodes" do
    field :number, :integer
    field :release_date, Ecto.Date
    belongs_to :season, MyStuffs.Season
    has_many :images, {"episodes_images", MyStuffs.Image}, foreign_key: :assoc_id

    timestamps
  end

  @required_fields ~w(number release_date)
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

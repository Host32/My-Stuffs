defmodule MyStuffs.ParentalRating do
  use MyStuffs.Web, :model

  schema "parental_ratings" do
    field :title, :string
    field :minimum_age, :integer

    timestamps
  end

  @required_fields ~w(title minimum_age)
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

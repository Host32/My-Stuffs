defmodule MyStuffs.Artist do
  use MyStuffs.Web, :model

  schema "artists" do
    field :name, :string
    field :bio, :string
    field :birth, Ecto.Date
    field :jobs, :string

    has_many :images, {"artists_images", Image}, foreign_key: :assoc_id

    timestamps
  end

  @required_fields ~w(name bio birth jobs)
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

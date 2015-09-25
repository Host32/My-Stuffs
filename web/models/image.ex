defmodule MyStuffs.Image do
  use MyStuffs.Web, :model

  schema "abstract table: images" do
    field :assoc_id, :integer
    field :file_name, :string

    timestamps
  end

  @required_fields ~w(file_name assoc_id)
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

defmodule MyStuffs.Comment do
  use MyStuffs.Web, :model

  schema "abstract table: comments" do
    field :assoc_id, :integer
    field :body, :string
    belongs_to :user, MyStuffs.User

    timestamps
  end

  @required_fields ~w(assoc_id body)
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

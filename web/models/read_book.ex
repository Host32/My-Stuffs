defmodule MyStuffs.ReadBook do
  use MyStuffs.Web, :model

  schema "read_books" do
    field :current_page, :integer
    field :start_read_date, Ecto.Date
    field :last_read_date, Ecto.Date
    field :conclusion_read_date, Ecto.Date
    field :notes, :string
    belongs_to :stuff, MyStuffs.Stuff
    belongs_to :user, MyStuffs.User

    timestamps
  end

  @required_fields ~w(current_page start_read_date last_read_date conclusion_read_date notes)
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

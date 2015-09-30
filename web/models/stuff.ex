defmodule MyStuffs.Stuff do
  use MyStuffs.Web, :model

  @type_saga 0
  @type_serie 1
  @type_film 2
  @type_book 3

  schema "stuffs" do
    field :type, :integer
    field :title, :string
    field :short_description, :string
    field :sinopsis, :string
    field :release_date, Ecto.Date
    field :duration, Ecto.Time
    field :pages, :integer
    field :banner_file_name, :string
    belongs_to :parental_rating, MyStuffs.ParentalRating
    has_many :images, {"stuffs_images", MyStuffs.Image}, foreign_key: :assoc_id
    has_many :stuffs_genres, MyStuffs.StuffGenre
    has_many :genres, through: [:stuffs_genres, :genres]
    has_many :comments, {"stuffs_comments", MyStuffs.Comment}, foreign_key: :assoc_id
    has_many :seasons, MyStuffs.Season

    timestamps
  end

  @required_fields ~w(type title short_description sinopsis release_date)
  @optional_fields ~w(duration pages)

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

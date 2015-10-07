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
    field :rating_count, :integer
    field :rating_stars, :integer
    belongs_to :parental_rating, MyStuffs.ParentalRating
    has_many :images, {"stuffs_images", MyStuffs.Image}, foreign_key: :assoc_id
    has_many :stuffs_genres, MyStuffs.StuffGenre
    has_many :genres, through: [:stuffs_genres, :genre]
    has_many :comments, {"stuffs_comments", MyStuffs.Comment}, foreign_key: :assoc_id
    has_many :seasons, MyStuffs.Season
    has_many :book_writers_ref, MyStuffs.BookWriter
    has_many :book_writers, through: [:book_writers_ref, :artist]
    has_many :ratings, MyStuffs.Rating

    timestamps
  end

  @book_required_fields ~w(title short_description sinopsis release_date pages)
  @book_optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def rating_changeset(model, params \\ :empty) do
    model
    |> cast(params, ~w(rating_count rating_stars), [])
  end

  def book_changeset(model, params \\ :empty) do
    model
    |> cast(params, @book_required_fields, @book_optional_fields)
    |> put_change(:type, @type_book)
  end

  def year(stuff) do
    {:ok, {year, _month, _day}} = Ecto.Date.dump(stuff.release_date)
    year
  end

  def type_saga, do: @type_saga
  def type_serie, do: @type_serie
  def type_film, do: @type_film
  def type_book, do: @type_book

  def calc_rating(0, _sum), do: 0
  def calc_rating(nil, _sum), do: 0
  def calc_rating(count, sum), do: sum / count
  def calc_rating(%MyStuffs.Stuff{rating_count: count, rating_stars: sum}), do: calc_rating(count, sum)

end

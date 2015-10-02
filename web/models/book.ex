defmodule MyStuffs.Book do

  defmodule Query do
    import Ecto.Query

    alias MyStuffs.Repo
    alias MyStuffs.Stuff

    def get!(model, id) do
      type = Stuff.type_book

      from(t in model, where: t.id == ^id and t.type == ^type, select: t)
        |> Repo.one!
    end

    def with_id(model, id) do
      from t in model, where: t.id == ^id
    end

    def with_comments(model) do
      from t in model, preload: :comments
    end

    def with_genres(model) do
      from t in model, preload: :genres
    end

    def with_parental_rating(model) do
      from t in model, preload: :parental_rating
    end

    def with_images(model) do
      from t in model, preload: :images
    end

    def with_writers(model) do
      from t in model, preload: :book_writers
    end

    def one!(model \\ Stuff) do
      type = Stuff.type_book

      from(t in model, where: t.type == ^type, select: t)
        |> Repo.one!
    end

    def all(model \\ Stuff) do
      type = Stuff.type_book

      from(t in model, where: t.type == ^type, select: t)
        |> Repo.all
    end
  end
end

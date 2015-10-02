defmodule MyStuffs.BookView do
  use MyStuffs.Web, :view

  def genre_links(conn, genres) do
    genres
    |> Enum.map(fn(genre) -> "<a href=\"#{genre_path(conn, :show, genre)}\">#{genre.title}</a>" end)
    |> Enum.join(", ")
    |> raw
  end

  def writer_links(conn, writers) do
    writers
    |> Enum.map(fn(writer) -> "<a href=\"#{artist_path(conn, :show, writer)}\">#{writer.name}</a>" end)
    |> Enum.join(", ")
    |> raw
  end

  def parental_rating_link(conn, parental_rating) do
    content = case parental_rating.minimum_age do
      0 -> "#{parental_rating.title}"
      _ -> "#{parental_rating.title} (#{parental_rating.minimum_age}+)"
    end

    content_tag(:a, content, href: parental_rating_path(conn, :show, parental_rating))
  end

end

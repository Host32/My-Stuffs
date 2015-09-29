defmodule MyStuffs.Repo.Migrations.CreateStuffGenre do
  use Ecto.Migration

  def change do
    create table(:stuffs_genres) do
      add :stuff_id, references(:stuffs)
      add :genre_id, references(:genres)

      timestamps
    end
    create index(:stuffs_genres, [:stuff_id])
    create index(:stuffs_genres, [:genre_id])

  end
end

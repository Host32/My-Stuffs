defmodule MyStuffs.Repo.Migrations.CreateWatchedFilm do
  use Ecto.Migration

  def change do
    create table(:watched_films) do
      add :date, :date
      add :notes, :text
      add :stuff_id, references(:stuffs)
      add :user_id, references(:users)

      timestamps
    end
    create index(:watched_films, [:stuff_id])
    create index(:watched_films, [:user_id])

  end
end

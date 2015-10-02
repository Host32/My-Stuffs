defmodule MyStuffs.Repo.Migrations.CreateBookWriter do
  use Ecto.Migration

  def change do
    create table(:book_writers) do
      add :stuff_id, references(:stuffs)
      add :artist_id, references(:artists)

      timestamps
    end
    create index(:book_writers, [:stuff_id])
    create index(:book_writers, [:artist_id])

  end
end

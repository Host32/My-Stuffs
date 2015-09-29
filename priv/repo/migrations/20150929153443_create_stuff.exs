defmodule MyStuffs.Repo.Migrations.CreateStuff do
  use Ecto.Migration

  def change do
    create table(:stuffs) do
      add :type, :integer
      add :title, :string
      add :short_description, :text
      add :sinopsis, :text
      add :release_date, :date
      add :duration, :time
      add :pages, :integer
      add :banner_file_name, :string
      add :parental_rating_id, references(:parental_ratings)

      timestamps
    end
    create index(:stuffs, [:parental_rating_id])

  end
end

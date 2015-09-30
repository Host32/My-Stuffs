defmodule MyStuffs.Repo.Migrations.CreateEpisode do
  use Ecto.Migration

  def change do
    create table(:episodes) do
      add :number, :integer
      add :release_date, :date
      add :season_id, references(:seasons)

      timestamps
    end
    create index(:episodes, [:season_id])

  end
end

defmodule MyStuffs.Repo.Migrations.CreateSeason do
  use Ecto.Migration

  def change do
    create table(:seasons) do
      add :number, :integer
      add :release_date, :date
      add :stuff_id, references(:stuffs)

      timestamps
    end
    create index(:seasons, [:stuff_id])

  end
end

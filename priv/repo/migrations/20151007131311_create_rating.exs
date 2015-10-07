defmodule MyStuffs.Repo.Migrations.CreateRating do
  use Ecto.Migration

  def change do
    create table(:ratings) do
      add :stars, :integer
      add :user_id, references(:users)
      add :stuff_id, references(:stuffs)

      timestamps
    end
    create index(:ratings, [:user_id])
    create index(:ratings, [:stuff_id])

  end
end

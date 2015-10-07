defmodule MyStuffs.Repo.Migrations.AddRatingFields do
  use Ecto.Migration

  def change do
    alter table(:stuffs) do
      add :rating_count, :integer, default: 0
      add :rating_stars, :integer, default: 0
    end
  end
end

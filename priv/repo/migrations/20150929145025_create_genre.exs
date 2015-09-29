defmodule MyStuffs.Repo.Migrations.CreateGenre do
  use Ecto.Migration

  def change do
    create table(:genres) do
      add :title, :string

      timestamps
    end

  end
end

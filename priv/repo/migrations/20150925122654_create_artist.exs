defmodule MyStuffs.Repo.Migrations.CreateArtist do
  use Ecto.Migration

  def change do
    create table(:artists) do
      add :name, :string
      add :bio, :text
      add :birth, :date
      add :jobs, :string

      timestamps
    end

  end
end

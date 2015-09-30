defmodule MyStuffs.Repo.Migrations.AddSeasonsImagesTable do
  use Ecto.Migration

  def change do
    create table(:seasons_images) do
      add :assoc_id, references(:seasons)
      add :file_name, :string

      timestamps
    end
  end
end

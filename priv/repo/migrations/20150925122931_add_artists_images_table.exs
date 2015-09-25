defmodule MyStuffs.Repo.Migrations.AddArtistsImagesTable do
  use Ecto.Migration

  def change do
    create table(:artists_images) do
      add :assoc_id, references(:artists)
      add :file_name, :string

      timestamps
    end
  end
end

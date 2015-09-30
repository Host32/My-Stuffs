defmodule MyStuffs.Repo.Migrations.AddEpisodesImagesTable do
  use Ecto.Migration

  def change do
    create table(:episodes_images) do
      add :assoc_id, references(:episodes)
      add :file_name, :string

      timestamps
    end
  end
end

defmodule MyStuffs.Repo.Migrations.AddStuffsImagesTable do
  use Ecto.Migration

  def change do
    create table(:stuffs_images) do
      add :assoc_id, references(:stuffs)
      add :file_name, :string

      timestamps
    end
  end
end

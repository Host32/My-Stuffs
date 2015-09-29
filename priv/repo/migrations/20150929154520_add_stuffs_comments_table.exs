defmodule MyStuffs.Repo.Migrations.AddStuffsCommentsTable do
  use Ecto.Migration

  def change do
    create table(:stuffs_comments) do
      add :assoc_id, references(:stuffs)
      add :body, :text
      add :user_id, references(:users)

      timestamps
    end
  end
end

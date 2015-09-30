defmodule MyStuffs.Repo.Migrations.CreateWatchedEpisode do
  use Ecto.Migration

  def change do
    create table(:watched_episodes) do
      add :date, :date
      add :notes, :text
      add :episode_id, references(:episodes)
      add :user_id, references(:users)

      timestamps
    end
    create index(:watched_episodes, [:episode_id])
    create index(:watched_episodes, [:user_id])

  end
end

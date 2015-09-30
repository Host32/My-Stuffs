defmodule MyStuffs.Repo.Migrations.CreateReadBook do
  use Ecto.Migration

  def change do
    create table(:read_books) do
      add :current_page, :integer
      add :start_read_date, :date
      add :last_read_date, :date
      add :conclusion_read_date, :date
      add :notes, :text
      add :stuff_id, references(:stuffs)
      add :user_id, references(:users)

      timestamps
    end
    create index(:read_books, [:stuff_id])
    create index(:read_books, [:user_id])

  end
end

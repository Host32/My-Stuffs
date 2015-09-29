defmodule MyStuffs.Repo.Migrations.CreateParentalRating do
  use Ecto.Migration

  def change do
    create table(:parental_ratings) do
      add :title, :string
      add :minimum_age, :integer

      timestamps
    end

  end
end

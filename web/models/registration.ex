defmodule MyStuffs.Registration do
  import Ecto.Changeset, only: [put_change: 3]

  def create(changeset, repo) do
    changeset
    |> put_change(:encrypted_password, hashed_password(changeset.params["password"]))
    |> repo.insert()
  end

  def hashed_password(password) do
    :crypto.hash(:md5, password) |> Base.encode16
  end

  def check_password(password, stored_hash) do
    hashed_password(password) == stored_hash
  end
end

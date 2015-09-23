defmodule MyStuffs.Session do
  alias MyStuffs.User

  def login(params, repo) do
    user = repo.get_by(User, email: String.downcase(params["email"]))
    case authenticate(user, params["password"]) do
      true -> {:ok, user}
      _ -> :error
    end
  end

  def authenticate(user, password) do
    case user do
      nil -> false
      _ -> password == user.encrypted_password
    end
  end
end

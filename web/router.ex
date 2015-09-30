defmodule MyStuffs.Router do
  use MyStuffs.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MyStuffs do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    get "/register", RegistrationController, :new
    post "/register", RegistrationController, :create

    get "/login", SessionController, :new
    post "/login", SessionController, :create
    delete "/login", SessionController, :delete

    resources "/artists", ArtistController
    resources "/genres", GenreController
    resources "/parental_ratings", ParentalRatingController
    resources "/stuffs", StuffController
    resources "/seasons", SeasonController
    resources "/episodes", EpisodeController
  end

  # Other scopes may use custom stacks.
  # scope "/api", MyStuffs do
  #   pipe_through :api
  # end
end

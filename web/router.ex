defmodule Gebetsgruppe.Router do
  use Gebetsgruppe.Web, :router

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

  scope "/", Gebetsgruppe do
    pipe_through :browser # Use the default browser stack
      get "/prayers",     PrayerController, :index
      get "/prayers/:id", PrayerController, :show

      get "/",            PageController,   :index
  end
    
  scope "/api/v0", Gebetsgruppe do
    pipe_through :api
      get "/prayers", PrayerController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", Gebetsgruppe do
  #   pipe_through :api
  # end
end

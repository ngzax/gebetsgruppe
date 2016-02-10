defmodule Gebetsgruppe.Router do
  use Gebetsgruppe.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  # Public Routes
  scope alias: Gebetsgruppe do
    pipe_through :browser
      get "/gebets",     GebetController, :index
      get "/gebets/:id", GebetController, :show
      get "/",           PageController,  :index
  end

  # Future private routes
  # scope alias: Gebetsgruppe do
  #   pipe_through [:browser, :auth]
  # end
    
  # Public API
  scope "/api/v0", alias: Gebetsgruppe do
    pipe_through :api
      resources "/gebets", GebetController, only: [:index]
  end

  # Private API
  # scope "/api/v0", alias: Gebetsgruppe do
  #   pipe_through [:api, :auth]
  #     get "/gebets", GebetController, :index
  # end
  
end

defmodule Gebetsgruppe.Router do
  use Gebetsgruppe.Web, :router
  require Sentinel
  
  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
  end

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  # Public Routes
  scope "/", Gebetsgruppe do
    pipe_through :browser
    
    get "/gebets",      GebetController,  :index
    get "/gebets/:id",  GebetController,  :show
                                          
    get "/",            PageController,   :index
  end

  # Private routes
  scope "/", Gebetsgruppe do
    pipe_through [:browser, :auth]
    
    get  "/login",    SessionController, :new,    as: :login
    post "/login",    SessionController, :create, as: :login
    
    delete "/logout", SessionController, :delete, as: :logout
    get    "/logout", SessionController, :delete, as: :logout

    resources "/users", UserController
  end
    
  # Public API
  scope "/api/v0", alias: Gebetsgruppe do
    pipe_through :api
      resources "/gebets", GebetController, only: [:index]
      
    Sentinel.mount
  end

  # Private API
  # scope "/api/v0", alias: Gebetsgruppe do
  #   pipe_through [:api, :auth]
  #     get "/gebets", GebetController, :index
  # end
  
end

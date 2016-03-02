defmodule Gebetsgruppe.Web do
  @moduledoc """
  A module that keeps using definitions for controllers,
  views and so on.

  This can be used in your application as:

      use Gebetsgruppe.Web, :controller
      use Gebetsgruppe.Web, :view

  The definitions below will be executed for every view,
  controller, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below.
  """

  def model do
    quote do
      use Ecto.Schema

      import Ecto
      import Ecto.Changeset
      import Ecto.Query, only: [from: 1, from: 2]
    end
  end

  def controller do
    quote do
      use Phoenix.Controller

      alias Gebetsgruppe.Repo
      import Ecto
      import Ecto.Query, only: [from: 1, from: 2]

      import Gebetsgruppe.Router.Helpers
      import Gebetsgruppe.Controller.Helpers
    end
  end

  def view do
    quote do
      use Phoenix.View, root: "web/templates"

      # Import convenience functions from controllers
      import Phoenix.Controller, only: [get_csrf_token: 0, get_flash: 2, view_module: 1]

      # Use all HTML functionality (forms, tags, etc)
      use Phoenix.HTML

      import Gebetsgruppe.Router.Helpers
      import Gebetsgruppe.ViewHelpers
    end
  end

  def router do
    quote do
      use Phoenix.Router
    end
  end

  def channel do
    quote do
      use Phoenix.Channel

      alias Gebetsgruppe.Repo
      import Ecto
      import Ecto.Query, only: [from: 1, from: 2]
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end

  @doc """
  Macros brought in (aka Cargo-culted) from PhoenixGuardian.
  """
  def admin_controller do
    quote do
      use Phoenix.Controller, namespace: Gebetsgruppe.Admin
      use Guardian.Phoenix.Controller, key: :admin

      alias Gebetsgruppe.Repo
      alias Guardian.Plug.EnsureAuthenticated
      alias Guardian.Plug.EnsurePermissions

      import Ecto.Model
      import Ecto.Query, only: [from: 1, from: 2]

      import Gebetsgruppe.Router.Helpers
      import Gebetsgruppe.Controller.Helpers
    end
  end
  
end

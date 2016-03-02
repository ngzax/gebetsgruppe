defmodule Gebetsgruppe.UserView do
  use Gebetsgruppe.Web, :view
  alias Gebetsgruppe.User

  def render("index.json", %{users: users}) do
    users
  end
  
end

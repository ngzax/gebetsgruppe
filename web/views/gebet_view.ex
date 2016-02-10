defmodule Gebetsgruppe.GebetView do
  use Gebetsgruppe.Web, :view
  alias Gebetsgruppe.Gebet

  def render("index.json", %{prayers: prayers}) do
    prayers
  end
  
end

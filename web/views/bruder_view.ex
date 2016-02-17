defmodule Gebetsgruppe.BruderView do
  use Gebetsgruppe.Web, :view
  alias Gebetsgruppe.Bruder

  def render("index.json", %{brueder: brueder}) do
    brueder
  end
  
end

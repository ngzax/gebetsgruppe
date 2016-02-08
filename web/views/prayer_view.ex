defmodule Gebetsgruppe.PrayerView do
  use Gebetsgruppe.Web, :view
  alias Gebetsgruppe.Prayer

  def render("index.json", %{prayers: prayers}) do
    prayers
  end
  
end

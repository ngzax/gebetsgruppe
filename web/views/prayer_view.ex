defmodule Gebetsgruppe.PrayerView do
  use Gebetsgruppe.Web, :view
  
  def render("index.json", %{prayers: prayers}) do
    prayers
  end
end

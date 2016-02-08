defmodule Gebetsgruppe.PrayerViewTest do
  use Gebetsgruppe.ConnCase, async: true
  import Phoenix.View
  
  test "renders index.html", %{conn: conn} do
    prayers = [
      %Gebetsgruppe.Prayer{id: "1", body: "First Prayer"}, 
      %Gebetsgruppe.Prayer{id: "2", body: "Second Prayer"}
    ]
    content = render_to_string(Gebetsgruppe.PrayerView, "index.html", conn: conn, prayers: prayers)

    assert String.contains?(content, "Prayers")

    for prayer <- prayers do
      assert String.contains?(content, prayer.body)
    end
  end
  
end

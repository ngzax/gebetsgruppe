defmodule Gebetsgruppe.GebetViewTest do
  use Gebetsgruppe.ConnCase, async: true
  import Phoenix.View
  
  test "renders index.html" do
    prayers = [
      %Gebetsgruppe.Gebet{id: "1", body: "First Prayer"},
      %Gebetsgruppe.Gebet{id: "2", body: "Second Prayer"}
    ]
    content = render_to_string(Gebetsgruppe.GebetView, "index.html", conn: conn, prayers: prayers)

    assert String.contains?(content, "Prayers")

    for prayer <- prayers do
      assert String.contains?(content, prayer.body)
    end
  end
  
end

defmodule Gebetsgruppe.PrayerControllerTest do
  use Gebetsgruppe.ConnCase

  test "GET /" do
    conn = get conn(), "/prayers"
    assert html_response(conn, 200) =~ "Willkommen zu die Gebetsguppe!"
  end
  
end

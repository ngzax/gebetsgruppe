defmodule Gebetsgruppe.AuthControllerTest do
  use Gebetsgruppe.ConnCase

  test "GET /" do
    conn = get conn(), "/gebets"
    assert html_response(conn, 200) =~ "Willkommen zu die Gebetsguppe!"
  end
  
end

defmodule Gebetsgruppe.BruderControllerTest do
  use Gebetsgruppe.ConnCase

  test "GET /" do
    conn = get conn(), "/brueder"
    assert html_response(conn, 200) =~ "Willkommen zu die Gebetsguppe!"
  end
  
end

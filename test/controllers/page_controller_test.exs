defmodule Gebetsgruppe.PageControllerTest do
  use Gebetsgruppe.ConnCase

  test "GET /" do
    conn = get conn(), "/"
    assert html_response(conn, 200) =~ "Willkommen zu die Gebetsguppe!"
  end

end

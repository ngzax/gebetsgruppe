defmodule Gebetsgruppe.PageControllerTest do
  use Gebetsgruppe.ConnCase

  test "GET /" do
    conn = get conn(), "/"
    # For a while, at least, this isn't really a web app and has nothing at the root.
    assert html_response(conn, 404) # =~ "Welcome to Phoenix!"
  end
end

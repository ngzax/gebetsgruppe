defmodule ListingPrayersIntegrationTest do
  use ExUnit.Case, async: true
  use Plug.Test
  
  alias Gebetsgruppe.Router
  
  @opts Router.init([])
  test "Listing All Prayers" do
    conn = conn(:get, "/prayers")
    response = Router.call(conn, @opts)
    assert response.status == 200
    assert response.resp_body == "[]"
  end
end
defmodule ListingPrayersIntegrationTest do
  use ExUnit.Case, async: true
  use Plug.Test
  
  alias Gebetsgruppe.Prayer
  alias Gebetsgruppe.Repo
  alias Gebetsgruppe.Router
  
  @opts Router.init([])
  test "Listing All Prayers" do
    %Prayer{body: "Pray for Health"} |> Repo.insert!
    prayers = Repo.all(Prayer) |> Poison.encode!
    
    conn = conn(:get, "/prayers")
    response = Router.call(conn, @opts)
    
    assert response.status == 200
    assert response.resp_body == prayers
  end
end
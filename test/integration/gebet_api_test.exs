defmodule GebetApiIntegrationTest do
  use ExUnit.Case, async: true
  use Plug.Test
  
  alias Gebetsgruppe.Gebet
  alias Gebetsgruppe.Repo
  alias Gebetsgruppe.Router
  
  @opts Router.init([])
  test "Returning All Gebets in JSON via API" do
    %Gebet{body: "Pray for Health"} |> Repo.insert!
    %Gebet{body: "Pray for Health"} |> Repo.insert!
    
    prayers = Repo.all(Gebet) |> Poison.encode!
    
    conn = conn(:get, "/api/v0/gebets")
    response = Router.call(conn, @opts)

    assert response.status == 200
    assert response.resp_body == prayers
  end

end

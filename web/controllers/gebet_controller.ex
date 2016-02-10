defmodule Gebetsgruppe.GebetController do
  use Gebetsgruppe.Web, :controller

  def index(conn, _params) do
    render(conn, prayers: Repo.all(Gebetsgruppe.Gebet))
  end
  
  def show(conn, %{"id" => id}) do
    prayer = Repo.get(Gebetsgruppe.Gebet, id) 
    render conn, "show.html", prayer: prayer
  end
  
end

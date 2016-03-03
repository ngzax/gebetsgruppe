defmodule Gebetsgruppe.GebetController do
  use Gebetsgruppe.Web, :controller

  def index(conn, _params, current_user, _claims) do
    render(conn, [prayers: Repo.all(Gebetsgruppe.Gebet), current_user: current_user])
  end
  
  def show(conn, %{"id" => id}, _current_user, _claims) do
    prayer = Repo.get(Gebetsgruppe.Gebet, id) 
    render conn, "show.html", prayer: prayer
  end
  
end

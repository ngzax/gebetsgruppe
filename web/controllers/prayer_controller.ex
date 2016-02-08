defmodule Gebetsgruppe.PrayerController do
  use Gebetsgruppe.Web, :controller

  def index(conn, _params) do
    render(conn, prayers: Repo.all(Gebetsgruppe.Prayer))
  end
  
  def show(conn, %{"id" => id}) do
    prayer = Repo.get(Gebetsgruppe.Prayer, id) 
    render conn, "show.html", prayer: prayer
  end
  
end

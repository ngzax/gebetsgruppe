defmodule Gebetsgruppe.PrayerController do
  use Gebetsgruppe.Web, :controller

  def index(conn, _params) do
    render conn, prayers: Repo.all(Gebetsgruppe.Prayer)
  end
  
end

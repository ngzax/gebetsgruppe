defmodule Gebetsgruppe.PrayerController do
  use Gebetsgruppe.Web, :controller

  def index(conn, _params) do
    render conn, prayers: []
  end
  
end

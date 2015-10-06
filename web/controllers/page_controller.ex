defmodule Gebetsgruppe.PageController do
  use Gebetsgruppe.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end

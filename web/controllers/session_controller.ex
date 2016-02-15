defmodule Gebetsgruppe.SessionController do
  use Gebetsgruppe.Web, :controller

  alias Gebetsgruppe.Bruder

  def new(conn, _) do
    changeset = Bruder.login_changeset(%Bruder{})
    render(conn, Gebetsgruppe.SessionView, "new.html", changeset: changeset)
  end

  def create(conn, params = %{}) do
    user = Repo.one(BruderQuery.by_email(params["user"]["email"] || ""))
    if user do
      changeset = Bruder.login_changeset(user, params["user"])
      if changeset.valid? do
        conn
        |> put_flash(:info, "Logged in.")
        |> Guardian.Plug.sign_in(user, :token)
        |> redirect(to: user_path(conn, :index))
      else
        render(conn, "new.html", changeset: changeset)
      end
    else
      changeset = Bruder.login_changeset(%Bruder{}) |> Ecto.Changeset.add_error(:login, "not found")
      render(conn, "new.html", changeset: changeset)
    end
  end

  def delete(conn, _params) do
    Guardian.Plug.sign_out(conn)
    |> put_flash(:info, "Logged out successfully.")
    |> redirect(to: "/")
  end

end

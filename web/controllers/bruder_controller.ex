defmodule Gebetsgruppe.BruderController do
  use Gebetsgruppe.Web, :controller

  alias Gebetsgruppe.Bruder
  # alias Gebetsgruppe.SessionController

  # plug :scrub_params, "bruder" when action in [:create, :update]
  # plug :action

  def index(conn, _params) do
    brueder = Repo.all(Bruder)
    render(conn, "index.html", brueder: brueder)
  end

  def new(conn, _params) do
    changeset = Bruder.create_changeset(%Bruder{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"bruder" => bruder_params}) do
    changeset = Bruder.create_changeset(%Bruder{}, bruder_params)

    if changeset.valid? do
      bruder = Repo.insert(changeset)

      conn
      |> put_flash(:info, "Brother created successfully.")
      |> Guardian.Plug.sign_in(bruder, :token, perms: %{ default: Guardian.Permissions.max })
      |> redirect(to: bruder_path(conn, :index))
    else
      render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    bruder = Repo.get(Bruder, id)
    render(conn, "show.html", bruder: bruder)
  end

  def edit(conn, %{"id" => id}) do
    bruder = Repo.get(Bruder, id)
    changeset = Bruder.update_changeset(bruder)
    render(conn, "edit.html", bruder: bruder, changeset: changeset)
  end

  def update(conn, %{"id" => id, "bruder" => bruder_params}) do
    bruder = Repo.get(Bruder, id)
    changeset = Bruder.update_changeset(bruder, bruder_params)

    if changeset.valid? do
      Repo.update(changeset)

      conn
      |> put_flash(:info, "Brother updated successfully.")
      |> redirect(to: bruder_path(conn, :index))
    else
      render(conn, "edit.html", bruder: bruder, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    bruder = Repo.get(Bruder, id)
    Repo.delete(bruder)

    conn
    |> put_flash(:info, "Brother deleted successfully.")
    |> redirect(to: bruder_path(conn, :index))
  end

  def forbidden(conn, _) do
    conn
    |> put_flash(:error, "Forbidden")
    |> redirect(to: bruder_path(conn, :index))
  end

end

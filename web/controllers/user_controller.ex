defmodule Gebetsgruppe.UserController do
  use Gebetsgruppe.Web, :controller

  alias Gebetsgruppe.Authorization
  alias Gebetsgruppe.Repo
  alias Gebetsgruppe.User

  # def index(conn, _params) do
  #   users = Repo.all(User)
  #   render(conn, "index.html", users: users)
  # end

  def new(conn, params, current_user, _claims) do
    render conn, "new.html", current_user: current_user
  end
  
  # def create(conn, %{"user" => user_params}) do
  #   changeset = User.create_changeset(%User{}, user_params)
  #
  #   if changeset.valid? do
  #     user = Repo.insert(changeset)
  #
  #     conn
  #     |> put_flash(:info, "Brother created successfully.")
  #     |> Guardian.Plug.sign_in(user, :token, perms: %{ default: Guardian.Permissions.max })
  #     |> redirect(to: user_path(conn, :index))
  #   else
  #     render(conn, "new.html", changeset: changeset)
  #   end
  # end
  #
  # def show(conn, %{"id" => id}) do
  #   user = Repo.get(User, id)
  #   render(conn, "show.html", user: user)
  # end
  #
  # def edit(conn, %{"id" => id}) do
  #   user = Repo.get(User, id)
  #   changeset = User.update_changeset(user)
  #   render(conn, "edit.html", user: user, changeset: changeset)
  # end
  #
  # def update(conn, %{"id" => id, "user" => user_params}) do
  #   user = Repo.get(User, id)
  #   changeset = User.update_changeset(user, user_params)
  #
  #   if changeset.valid? do
  #     Repo.update(changeset)
  #
  #     conn
  #     |> put_flash(:info, "Brother updated successfully.")
  #     |> redirect(to: user_path(conn, :index))
  #   else
  #     render(conn, "edit.html", user: user, changeset: changeset)
  #   end
  # end
  #
  # def delete(conn, %{"id" => id}) do
  #   user = Repo.get(User, id)
  #   Repo.delete(user)
  #
  #   conn
  #   |> put_flash(:info, "Brother deleted successfully.")
  #   |> redirect(to: user_path(conn, :index))
  # end
  #
  # def forbidden(conn, _) do
  #   conn
  #   |> put_flash(:error, "Forbidden")
  #   |> redirect(to: user_path(conn, :index))
  # end

end

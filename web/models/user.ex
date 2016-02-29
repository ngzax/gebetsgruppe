defmodule Gebetsgruppe.User do
  use Gebetsgruppe.Web, :model
  alias Gebetsgruppe.Repo

  @primary_key      {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  
  schema "users" do
    field :confirmed_at,                Ecto.DateTime
    field :email,                       :string
    field :hashed_password,             :string
    field :hashed_confirmation_token,   :string
    field :hashed_password_reset_token, :string
    field :is_admin,                    :boolean, default: false
    field :name,                        :string
    field :password,                    :string,  virtual: true
    field :role,                        :string
    field :unconfirmed_email,           :string    
    timestamps
    
    has_many :authorizations, Gebetsgruppe.Authorization
  end

  @required_fields ~w(email hashed_password is_admin name)
  @optional_fields ~w(confirmed_at role unconfirmed_email)

  # ----
  # The following code was (mostly) cargo-culted wholesale from https://github.com/hassox/phoenix_guardian/blob/master/web/models/user.ex
  # I did need to update a few things for more recent Ecto, however.
  # ----
  def admin?(u) do
    u.is_admin
  end
  
  def create_changeset(model, params \\ :empty) do
    model
    |> cast(params, ~w(name email password),~w(hashed_password))
    |> maybe_update_password
  end

  def from_email(nil), do: { :error, :not_found }
  def from_email(email) do
    Repo.one(User, email: email)
  end

  def login_changeset(model), do: model |> cast(%{}, ~w(), ~w(email password))

  def login_changeset(model, params) do
    model
    |> cast(params, ~w(email password), ~w())
    |> validate_password
  end

  def make_admin!(user) do
    user
    |> cast(%{is_admin: true}, ~w(), ~w(is_admin))
    |> Repo.update!
  end
  
  def permissions(role) do
  end
  
  def update_changeset(model, params \\ :empty) do
    model
    |> cast(params, ~w(), ~w(name email password))
    |> maybe_update_password
  end

  def valid_password?(nil, _), do: false
  def valid_password?(_, nil), do: false
  def valid_password?(password, crypted), do: Comeonin.Bcrypt.checkpw(password, crypted)

  # ----
  
  defp maybe_update_password(changeset) do
    case Ecto.Changeset.fetch_change(changeset, :password) do
      { :ok, password } ->
        changeset
        |> Ecto.Changeset.put_change(:hashed_password, Comeonin.Bcrypt.hashpwsalt(password))
      :error -> changeset
    end
  end

  defp validate_password(changeset) do
    case Ecto.Changeset.get_field(changeset, :hashed_password) do
      nil -> password_incorrect_error(changeset)
      crypted -> validate_password(changeset, crypted)
    end
  end

  defp validate_password(changeset, crypted) do
    password = Ecto.Changeset.get_change(changeset, :password)
    if valid_password?(password, crypted), do: changeset, else: password_incorrect_error(changeset)
  end

  defp password_incorrect_error(changeset), do: Ecto.Changeset.add_error(changeset, :password, "is incorrect")

end

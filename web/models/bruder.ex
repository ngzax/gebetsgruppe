defmodule Gebetsgruppe.Bruder do
  use Gebetsgruppe.Web, :model
  alias Gebetsgruppe.Repo
  
  schema "bruders" do
    field :name,               :string
    field :email,              :string
    field :encrypted_password, :string
    field :password,           :string, virtual: true
    timestamps
  end

  @required_fields ~w(name email encrypted_password password)
  @optional_fields ~w()

  # ----
  # The following code was (mostly) cargo-culted wholesale from https://github.com/hassox/phoenix_guardian/blob/master/web/models/user.ex
  # I did need to update a few things for more recent Ecto, however.
  # ----
    
  def from_email(nil), do: { :error, :not_found }
  def from_email(email) do
    Repo.one(User, email: email)
  end

  def create_changeset(model, params \\ :empty) do
    model
    |> cast(params, ~w(name email password),~w(encrypted_password))
    |> maybe_update_password
  end

  def update_changeset(model, params \\ :empty) do
    model
    |> cast(params, ~w(), ~w(name email password))
    |> maybe_update_password
  end

  def login_changeset(model), do: model |> cast(%{}, ~w(), ~w(email password))

  def login_changeset(model, params) do
    model
    |> cast(params, ~w(email password), ~w())
    |> validate_password
  end

  def valid_password?(nil, _), do: false
  def valid_password?(_, nil), do: false
  def valid_password?(password, crypted), do: Comeonin.Bcrypt.checkpw(password, crypted)

  defp maybe_update_password(changeset) do
    case Ecto.Changeset.fetch_change(changeset, :password) do
      { :ok, password } ->
        changeset
        |> Ecto.Changeset.put_change(:encrypted_password, Comeonin.Bcrypt.hashpwsalt(password))
      :error -> changeset
    end
  end

  defp validate_password(changeset) do
    case Ecto.Changeset.get_field(changeset, :encrypted_password) do
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

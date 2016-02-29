defmodule Gebetsgruppe.Authorization do
  use Gebetsgruppe.Web, :model

  schema "authorizations" do
    field :expires_at,            :integer
    field :password,              :string, virtual: true
    field :password_confirmation, :string, virtual: true
    field :provider,              :string
    field :refresh_token,         :string
    field :token,                 :string
    field :uid,                   :string

    belongs_to :user, Gebetsgruppe.User, type: :binary_id

    timestamps
  end

  @required_fields ~w(provider token uid user_id)
  @optional_fields ~w(expires_at refresh_token)

  @doc """
  Creates a changeset based on the `model` and `params`.
  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> unique_constraint(:provider_uid)
    |> foreign_key_constraint(:user_id)
  end

end

defmodule Gebetsgruppe.Genehmigung do
  use Gebetsgruppe.Web, :model

  schema "genehmigungen" do
    field :provider,              :string
    field :uid,                   :string
    field :token,                 :string
    field :refresh_token,         :string
    field :expires_at,            :integer
    field :password,              :string, virtual: true
    field :password_confirmation, :string, virtual: true

    belongs_to :bruder, Gebetsgruppe.Bruder

    timestamps
  end

  @required_fields ~w(provider uid bruder_id token)
  @optional_fields ~w(refresh_token expires_at)

  @doc """
  Creates a changeset based on the `model` and `params`.
  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> foreign_key_constraint(:bruder_id)
    |> unique_constraint(:provider_uid)
  end

end

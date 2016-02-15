defmodule Gebetsgruppe.Factory do
  use ExMachina.Ecto, repo: Gebetsgruppe.Repo

  alias Gebetsgruppe.Bruder
  alias Gebetsgruppe.Genehmigung
  alias Gebetsgruppe.GuardianToken

  def factory(:bruder) do
    %Bruder{
      name:               "Cindy Loo Who",
      email:              sequence(:email, &"email-#{&1}@ngzax.com"),
      encrypted_password: UUID.uuid4()
    }
  end

  # def factory(:guardian_token) do
  #   %GuardianToken{
  #     jti: sequence(:jti, &"jti-#{&1}"),
  #   }
  # end

  def factory(:authorization) do
    %Genehmigung{
      uid:      sequence(:uid, &"uid-#{&1}"),
      bruder:   build(:bruder),
      provider: "identity",
      token:    Comeonin.Bcrypt.hashpwsalt("sekrit")
    }
  end

  def with_authorization(bruder, opts \\ []) do
    opts = opts ++ [bruder: bruder, uid: bruder.email]
    create(:authorization, opts)
  end
end
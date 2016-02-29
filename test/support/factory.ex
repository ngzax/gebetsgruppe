defmodule Gebetsgruppe.Factory do
  use ExMachina.Ecto, repo: Gebetsgruppe.Repo

  alias Gebetsgruppe.User
  alias Gebetsgruppe.Authorization
  # alias Gebetsgruppe.GuardianToken

  def factory(:user) do
    %User{
      name:            "Cindy Loo Who",
      email:           sequence(:email, &"email-#{&1}@ngzax.com"),
      hashed_password: UUID.uuid4()
    }
  end

  # def factory(:guardian_token) do
  #   %GuardianToken{
  #     jti: sequence(:jti, &"jti-#{&1}"),
  #   }
  # end

  def factory(:authorization) do
    %Authorization{
      uid:      sequence(:uid, &"uid-#{&1}"),
      user:     build(:user),
      provider: "identity",
      token:    Comeonin.Bcrypt.hashpwsalt("sekrit")
    }
  end

  def with_authorization(user, opts \\ []) do
    opts = opts ++ [user: user, uid: user.email]
    create(:authorization, opts)
  end
end
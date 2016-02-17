defmodule Gebetsgruppe.Factory do
  use ExMachina.Ecto, repo: Gebetsgruppe.Repo

  alias Gebetsgruppe.Bruder

  def factory(:bruder) do
    %Bruder{
      name:               "Cindy Loo Who",
      email:              sequence(:email, &"email-#{&1}@ngzax.com"),
      encrypted_password: UUID.uuid4()
    }
  end

end

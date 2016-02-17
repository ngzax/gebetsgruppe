defmodule Gebetsgruppe.Factory do
  use ExMachina.Ecto, repo: Gebetsgruppe.Repo

  alias Gebetsgruppe.Bruder

  def factory(:bruder) do
    %Bruder{
      name:     "Cindy Loo Who",
      username: sequence(:username, &"cloowho-#{&1}"),
      email:    sequence(:email, &"email-#{&1}@ngzax.com"),
      hash:     UUID.uuid4()
    }
  end

end

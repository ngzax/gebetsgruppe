defmodule Gebetsgruppe.GuardianSerializer do
  @behaviour Guardian.Serializer

  alias Gebetsgruppe.Repo
  alias Gebetsgruppe.Bruder

  def for_token(bruder = %Bruder{}), do: { :ok, "Brother: #{bruder.id}" }
  def for_token(_), do: { :error, "Unknown resource type" }

  def from_token("Brother: " <> id), do: { :ok, Repo.get(Bruder, String.to_integer(id)) }
  def from_token(thing), do: { :error, "Unknown resource type" }

end

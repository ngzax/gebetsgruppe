defmodule Gebetsgruppe.GuardianSerializer do
  @behaviour Guardian.Serializer

  alias Gebetsgruppe.Repo
  alias Gebetsgruppe.User

  def for_token(User = %User{}), do: { :ok, "Brother: #{User.id}" }
  def for_token(_), do: { :error, "Unknown resource type" }

  def from_token("Brother: " <> id), do: { :ok, Repo.get(User, String.to_integer(id)) }
  def from_token(thing), do: { :error, "Unknown resource type" }

end

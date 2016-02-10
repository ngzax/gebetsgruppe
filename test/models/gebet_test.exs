defmodule Gebetsgruppe.GebetTest do
  use Gebetsgruppe.ModelCase

  alias Gebetsgruppe.Gebet

  @valid_attrs   %{body: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Gebet.changeset(%Gebet{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Gebet.changeset(%Gebet{}, @invalid_attrs)
    refute changeset.valid?
  end

end

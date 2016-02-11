defmodule Gebetsgruppe.BruderTest do
  use Gebetsgruppe.ModelCase

  alias Gebetsgruppe.Bruder

  @valid_attrs %{email: "some content", encrypted_password: "some content", name: "some content", password: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Bruder.changeset(%Bruder{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Bruder.changeset(%Bruder{}, @invalid_attrs)
    refute changeset.valid?
  end
end

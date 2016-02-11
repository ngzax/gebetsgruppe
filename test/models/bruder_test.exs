defmodule Gebetsgruppe.BruderTest do
  use Gebetsgruppe.ModelCase

  alias Gebetsgruppe.Bruder

  # That password is "pray" bcrypted via https://www.bcrypt-generator.com/
  @valid_attrs %{email: "bruder@kirche.com", encrypted_password: "$2a$08$2fPajyRgQEyA6PA7KU/1CurOz26ITt7CY6qox3vR10FRK8iA8oaDe", name: "Big Bruder", password: "pray"}
  @invalid_attrs %{}

  test "Can create a Valid User" do
    changeset = Bruder.create_changeset(%Bruder{}, @valid_attrs)
    assert changeset.valid?
  end

  test "Won't create an Invalid User" do
    changeset = Bruder.create_changeset(%Bruder{}, @invalid_attrs)
    refute changeset.valid?
  end
end

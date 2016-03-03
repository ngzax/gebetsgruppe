defmodule Gebetsgruppe.UserTest do
  use Gebetsgruppe.ModelCase

  alias Gebetsgruppe.User

  # That password is "pray" bcrypted via https://www.bcrypt-generator.com/
  @valid_attrs %{email: "User@kirche.com", hashed_password: "$2a$08$2fPajyRgQEyA6PA7KU/1CurOz26ITt7CY6qox3vR10FRK8iA8oaDe", name: "Big User", password: "pray"}
  @invalid_attrs %{}

  setup do
    normal = create(:user) # |> with_authorization
    admin = create(:user)   |> User.make_admin! #|> with_authorization
    {:ok, %{normal: normal, admin: admin}}
  end
  
  test "Can create a Valid User" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "Won't create an Invalid User" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "Can make a User an Admin", users do
    refute users.normal.is_admin
    n = User.make_admin!(users.normal)
    assert User.admin?(n)
  end
  
end

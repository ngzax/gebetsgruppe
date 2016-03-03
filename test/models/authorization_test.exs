defmodule Gebetsgruppe.AuthorizationTest do
  use Gebetsgruppe.ModelCase

  alias Gebetsgruppe.User
  alias Gebetsgruppe.Authorization

  @valid_attrs   %{provider: "some content", uid: "some content", user_id: UUID.uuid4(), token: "some token"}
  @invalid_attrs %{}

  setup do
    user_auth = create(:user) |> with_authorization
    admin_auth  = create(:user) |> User.make_admin! |> with_authorization

    {:ok, %{user: user_auth, admin: admin_auth}}
  end
  
  test "changeset with valid attributes", authorizations do
    %{@valid_attrs | user_id: authorizations[:user].user.id}
    changeset = Authorization.changeset(%Authorization{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Authorization.changeset(%Authorization{}, @invalid_attrs)
    refute changeset.valid?
  end

end
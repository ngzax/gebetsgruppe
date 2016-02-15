defmodule Gebetsgruppe.GenehmigungTest do
  use Gebetsgruppe.ModelCase

  alias Gebetsgruppe.Bruder
  alias Gebetsgruppe.Genehmigung

  @valid_attrs   %{provider: "some content", uid: "some content", bruder_id: "#{UUID.uuid4()}", token: "some token"}
  @invalid_attrs %{}

  setup do
    bruder = create(:bruder)# |> with_authorization
    admin  = create(:bruder)  |> Bruder.make_admin! #|> with_authorization

    {:ok, %{bruder: bruder, admin: admin}}
  end
  
  # test "changeset with valid attributes", brueder do
  #   %{@valid_attrs | :bruder_id => brueder[:bruder]}
  #   changeset = Genehmigung.changeset(%Genehmigung{}, @valid_attrs)
  #   IO.puts("#{inspect changeset}")
  #   assert changeset.valid?
  # end

  test "changeset with invalid attributes" do
    changeset = Genehmigung.changeset(%Genehmigung{}, @invalid_attrs)
    refute changeset.valid?
  end

end
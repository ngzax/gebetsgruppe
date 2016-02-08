defmodule Gebetsgruppe.PrayerTest do
  use Gebetsgruppe.ModelCase

  alias Gebetsgruppe.Prayer

  @valid_attrs   %{body: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Prayer.changeset(%Prayer{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Prayer.changeset(%Prayer{}, @invalid_attrs)
    refute changeset.valid?
  end
end

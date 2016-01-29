defmodule Gebetsgruppe.Prayer do
  use Gebetsgruppe.Web, :model

  schema "prayers" do
    field :body, :string
    timestamps
  end

  @required_fields ~w(body)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
  
  defimpl Poison.Encoder, for: Gebetsgruppe.Prayer do
    def encode(prayer, _options) do
      prayer
      |> Map.from_struct
      |> Map.drop([:__meta__, :__struct__])
      |> Poison.encode!
    end
  end
end

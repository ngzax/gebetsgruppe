defmodule Gebetsgruppe.Gebet do
  use Gebetsgruppe.Web, :model

  schema "gebets" do
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
  
  defimpl Poison.Encoder, for: Gebetsgruppe.Gebet do
    def encode(gebet, _options) do
      gebet
      |> Map.from_struct
      |> Map.drop([:__meta__, :__struct__])
      |> Poison.encode!
    end
  end
end

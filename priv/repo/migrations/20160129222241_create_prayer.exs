defmodule Gebetsgruppe.Repo.Migrations.CreatePrayer do
  use Ecto.Migration

  def change do
    create table(:prayers) do
      add :body, :string

      timestamps
    end

  end
end

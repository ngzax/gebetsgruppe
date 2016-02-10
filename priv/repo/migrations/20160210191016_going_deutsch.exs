defmodule Gebetsgruppe.Repo.Migrations.GoingDeutsch do
  use Ecto.Migration

  def change do
    rename table(:prayers), to: table(:gebet)
  end
  
end

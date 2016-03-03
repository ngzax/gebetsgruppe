defmodule Gebetsgruppe.Repo.Migrations.RelaxSentinel do
  use Ecto.Migration

  def up do
    alter table(:users) do
      modify :hashed_password, :text, null: true
    end
  end
  
  def down do
    alter table(:users) do
      modify :hashed_password, :text, null: false
    end
  end
  
end

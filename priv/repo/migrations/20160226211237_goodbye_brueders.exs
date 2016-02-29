defmodule Gebetsgruppe.Repo.Migrations.GoodbyeBrueders do
  use Ecto.Migration

  def change do
    rename table(:brueder), to: table(:users)
    rename table(:genehmigungen), to: table(:authorizations)
    
    rename table(:authorizations), :bruder_id, to: :user_id
  end
  
end

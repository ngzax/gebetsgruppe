defmodule Gebetsgruppe.Repo.Migrations.BrudersUseAddict do
  use Ecto.Migration

  def change do
    alter table(:brueder) do
      add :username,      :text,    [null: false]
      add :recovery_hash, :text,    [null: true]
    end
    
    rename table(:brueder), :encrypted_password, to: :hash
    
    create index(:brueder, [:username], unique: true)
  end

end

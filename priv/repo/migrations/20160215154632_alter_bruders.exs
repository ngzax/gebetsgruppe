defmodule Gebetsgruppe.Repo.Migrations.AlterBruders do
  use Ecto.Migration

  def up do
    execute("CREATE EXTENSION IF NOT EXISTS citext;")
    execute("CREATE EXTENSION IF NOT EXISTS \"uuid-ossp\";")
    
    drop table(:bruders)
    
    create table(:brueder, primary_key: false) do
      add :id,                 :uuid,    [primary_key: true, default: fragment("uuid_generate_v4()")]
      add :name,               :text,    [null: false]
      add :email,              :citext,  [null: false]
      add :encrypted_password, :text,    [null: false]
      add :is_admin,           :boolean, [null: false, default: false]
      timestamps
    end
    
    create index(:brueder, [:email], unique: true)
  end

  def down do
    drop table(:brueder)
    
    create table(:bruders) do
      add :name, :string
      add :email, :string
      add :encrypted_password, :string
      timestamps
    end
  end

end

defmodule Gebetsgruppe.Repo.Migrations.CreateGenehmigung do
  use Ecto.Migration

  def change do
    create table(:genehmigungen) do
      add :provider,      :string
      add :uid,           :string
      add :bruder_id,     references(:brueder, [type: :uuid, on_delete: :delete_all])
      add :token,         :text
      add :refresh_token, :text
      add :expires_at,    :bigint
      timestamps
    end

    create index(:genehmigungen, [:provider, :uid], unique: true)
    create index(:genehmigungen, [:expires_at])
    create index(:genehmigungen, [:provider, :token])
    
    create table(:guardian_tokens, primary_key: false) do
      add :jti,    :string, primary_key: true
      add :aud,    :string
      add :iss,    :string
      add :sub,    :string
      add :typ,    :string
      add :exp,    :bigint
      add :jwt,    :text
      add :claims, :map
      timestamps
    end
  end

end

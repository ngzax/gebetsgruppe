defmodule Gebetsgruppe.Repo.Migrations.CreateBruder do
  use Ecto.Migration

  def change do
    create table(:bruders) do
      add :name, :string
      add :email, :string
      add :encrypted_password, :string
      timestamps
    end

  end
end

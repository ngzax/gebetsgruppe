defmodule Gebetsgruppe.Repo.Migrations.AddSentinel do
  use Ecto.Migration

  def change do
    alter table(:brueder) do
      add :confirmed_at,                :datetime
      add :role,                        :text
      add :hashed_confirmation_token,   :text
      add :hashed_password_reset_token, :text
      add :unconfirmed_email,           :text
    end
    
    rename table(:brueder), :encrypted_password, to: :hashed_password
  end

end

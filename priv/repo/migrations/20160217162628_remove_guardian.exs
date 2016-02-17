defmodule Gebetsgruppe.Repo.Migrations.RemoveGuardian do
  use Ecto.Migration

  def up do
    drop table(:genehmigungen)
    drop table(:guardian_tokens)
  end

end

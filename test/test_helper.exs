Application.ensure_all_started(:hound)
ExUnit.start

Ecto.Adapters.SQL.begin_test_transaction(Gebetsgruppe.Repo)

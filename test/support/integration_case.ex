defmodule Gebetsgruppe.IntegrationCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use Hound.Helpers

      import Ecto.Model
      import Ecto.Query, only: [from: 2]
      import Gebetsgruppe.Router.Helpers

      alias Gebetsgruppe.Repo

      # The default endpoint for testing
      @endpoint Gebetsgruppe.Endpoint

      hound_session
    end
  end

  setup tags do
    unless tags[:async] do
      Ecto.Adapters.SQL.restart_test_transaction(Gebetsgruppe.Repo, [])
    end
    
    :ok
  end
end
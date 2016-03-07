# Check if the phantomjs server needed for integration tests is running...
case :gen_tcp.connect('localhost', 8910, []) do
  {:ok, socket} ->
    :gen_tcp.close(socket)
    Application.ensure_all_started(:hound)
  {:error, _reason} ->
    ExUnit.configure(exclude: [needs_phantomjs: true])
end

ExUnit.start()

Ecto.Adapters.SQL.begin_test_transaction(Gebetsgruppe.Repo)

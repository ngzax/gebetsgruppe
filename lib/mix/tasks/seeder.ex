defmodule Mix.Tasks.Seeder do
  use Mix.Task

  @shortdoc "Seeds the database from files"
  def run(_args) do
    exec_sql
    Mix.shell.info "Seeding completed."
  end

  
  defp exec_sql do
    Enum.each(file_names, fn file_name ->
      case File.read(file_name) do
        {:ok, _}    -> Mix.shell.cmd("psql -d gebetsgruppe_#{Mix.env} -f #{Path.join(sql_dir, file_name)}")
        {:error, _} -> IO.puts("Error on #{file_name}.")
      end 
    end)
  end
  
  defp sql_dir do
    Path.join([File.cwd!, "priv", "repo"])
  end
  
  defp file_names do
    [
      "things_1.sql",
      "things_2.sql",
      "things_3.sql"
    ]
  end
  
end
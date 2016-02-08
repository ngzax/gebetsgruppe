defmodule PrayerListIntegrationTest do
  use Gebetsgruppe.IntegrationCase
  # use ExUnit.Case, async: true
  # use Plug.Test
  
  alias Gebetsgruppe.Prayer
  alias Gebetsgruppe.Repo
  # alias Gebetsgruppe.Router

  setup do
    %Prayer{body: "Pray for Health"} |> Repo.insert!
    %Prayer{body: "Pray for Wealth"} |> Repo.insert!
    navigate_to("/prayers")
    :ok
  end

  test "Page is correctly titled" do
    assert page_title() == "Willkommen zu die Gebetsguppe!"
  end
  
  test "Shows all prayers in a table" do
    row_ids = prayer_table_rows
    assert length(row_ids) == 2
    
    # IO.puts("#{keys(row_ids)}")
    # IO.puts("#{find_all_within_element(row_ids(0), :tag, "td")}")
    # assert String.contains?(visible_page_text, "Pray for Health")
    assert prayer_on_the_list("Pray for Health")
    assert prayer_on_the_list("Pray for Wealth")
    refute prayer_on_the_list("Pray for Riches!")
  end
  
  defp prayer_on_the_list(prayer_body_text) do
    String.contains?(visible_page_text, prayer_body_text)
  end

  defp prayer_table_rows do
    find_element(:tag, "tbody")
      |> find_all_within_element(:tag, "tr")
  end

end

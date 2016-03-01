# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Gebetsgruppe.Repo.insert!(
  %Gebetsgruppe.User{
      name:            "Daryl Richter",
      email:           "daryl@ngzax.com",
      hashed_password: Comeonin.Bcrypt.hashpwsalt("lag00na="),
      is_admin:        true
  }
)

Gebetsgruppe.Repo.insert!(%Gebetsgruppe.Gebet{body: "Pray for Health"})
Gebetsgruppe.Repo.insert!(%Gebetsgruppe.Gebet{body: "Pray for Wealth"})
Gebetsgruppe.Repo.insert!(%Gebetsgruppe.Gebet{body: "Pray for Wisdom"})

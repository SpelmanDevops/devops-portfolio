resource "azurerm_mssql_server" "db_server" {
  name                         = "devops-db-server"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "P@ssw0rd1234!"
}

resource "azurerm_mssql_database" "database" {
  name                = "devopsdb"
  server_id          = azurerm_mssql_server.db_server.id
  sku_name           = "Basic"  # Cheapest option (~£4/month)
}

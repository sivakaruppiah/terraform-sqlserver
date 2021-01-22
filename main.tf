
# Configure the Microsoft Azure Provider
provider "azurerm" {
    # The "feature" block is required for AzureRM provider 2.x. 
    # If you're southing version 1.x, the "features" block is not allowed.
    features {}

  # More information on the authentication methods supported by
  # the AzureRM Provider can be found here:
  # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs

  # subscription_id = "..."
  # client_id       = "..."
  # client_secret   = "..."
  # tenant_id       = "..."  
}

resource "azurerm_resource_group" "example" {
  name     = "database-rg"
  location = "West US"
}


resource "azurerm_sql_server" "example" {
  name                         = "mssqlserver-azuredevops"
  resource_group_name          = azurerm_resource_group.example.name
  location                     = azurerm_resource_group.example.location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "Whatisthepassword123"

  
  tags = {
    environment = "demo"
  }
}

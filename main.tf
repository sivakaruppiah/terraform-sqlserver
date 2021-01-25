
# Configure the Microsoft Azure Provider
provider "azurerm" {
    # The "feature" block is required for AzureRM provider 2.x. 
    # If you're southing version 1.x, the "features" block is not allowed.
    version = "~>2.0"
    features {}

  # More information on the authentication methods supported by
  # the AzureRM Provider can be found here:
  # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs

   subscription_id = "423777e6-d2d1-4457-be29-3d98b3cd537c"
   client_id       = "4e7c311e-0bad-4c62-a960-fae95d64609f"
   client_secret   = "Rs~kSGFs.A0ddI-wWY5~~pCTucq.geqDIB"
   tenant_id       = "17c6997b-f6d9-4a44-8ddd-800751c7ebdd"  
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

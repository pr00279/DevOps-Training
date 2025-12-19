# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.0"
    }
  }
  required_version = ">= 0.14.9"
}
provider "azurerm" {
  features {}
}

# Generate a random integer to create a globally unique name
resource "random_integer" "ri" {
  min = 10000
  max = 99999
}

# Import the resource group
resource "azurerm_resource_group" "rg" {
  location = "uksouth"
  name     = "FileVault"
}
resource "azurerm_storage_account" "sa" {
  account_replication_type        = "LRS"
  account_tier                    = "Standard"
  allow_nested_items_to_be_public = false
  location                        = "uksouth"
  name                            = "pr00279filevault"
  resource_group_name             = "FileVault"
  depends_on = [
    azurerm_resource_group.rg
  ]
}
resource "azurerm_storage_container" "res-3" {
  name               = "filevault-container"
  storage_account_id = "/subscriptions/adc0e27b-f4cc-4114-9a33-7200f92047ef/resourceGroups/FileVault/providers/Microsoft.Storage/storageAccounts/pr00279filevault"
  depends_on = [
    # One of azurerm_storage_account.res-1,azurerm_storage_account_queue_properties.res-5 (can't auto-resolve as their ids are identical)
  ]
}
resource "azurerm_storage_account_queue_properties" "res-5" {
  storage_account_id = azurerm_storage_account.sa.id
  hour_metrics {
    version = "1.0"
  }
  logging {
    delete  = false
    read    = false
    version = "1.0"
    write   = false
  }
  minute_metrics {
    version = "1.0"
  }
}

# Create the Linux App Service Plan
resource "azurerm_service_plan" "appserviceplan" {
  name                = "webapp-asp-${random_integer.ri.result}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  sku_name            = "B1"
}

# Create the web app, pass in the App Service Plan ID
resource "azurerm_linux_web_app" "webapp" {
  name                  = "webapp-${random_integer.ri.result}"
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  service_plan_id       = azurerm_service_plan.appserviceplan.id
  depends_on            = [azurerm_service_plan.appserviceplan]
  https_only            = true
  site_config {
    minimum_tls_version = "1.2"
    application_stack {
      node_version = "24-lts"
    }
  }
}

#  Deploy code from a public GitHub repo
resource "azurerm_app_service_source_control" "sourcecontrol" {
  app_id             = azurerm_linux_web_app.webapp.id
  repo_url           = "https://github.com/pr00279/DevOps-Training"
  branch             = "master"
  use_manual_integration = true
  use_mercurial      = false
}
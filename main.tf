# main.tf

provider "azurerm" {
  features = {}


resource "azurerm_resource_group" "k200265" {
  name     = "k200265-resource-group"
  location = "South Central Asia"
}

resource "azurerm_app_service_plan" "k200265" {
  name                = "k200265-app-service-plan"
  resource_group_name = azurerm_resource_group.k200265.name
  location            = azurerm_resource_group.k200265.location
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Basic"
    size = "B1"
  }
}

resource "azurerm_app_service" "k200265" {
  name                = "k200265-app-service"
  resource_group_name = azurerm_resource_group.k200265.name
  location            = azurerm_resource_group.k200265.location
  app_service_plan_id = azurerm_app_service_plan.k200265.id

  site_config {
    always_on = true
  }

  app_settings = {
    "WEBSITE_PYTHON_VERSION" = "3.8"
  }

  site_config {
    linux_fx_version = "PYTHON|3.8"
  }
}
}

resource "azurerm_monitor_autoscale_setting" "autoscale" {
  name                = "autoscale-web-vm"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  target_resource_id  = azurerm_linux_virtual_machine.web.id

  profile {
    name = "defaultProfile"

    capacity {
      default = 1
      minimum = 1
      maximum = 3  # Scale up to 3 VMs when needed
    }

    # Scale up when CPU usage exceeds 75%
    rule {
      metric_trigger {
        metric_name        = "Percentage CPU"
        metric_resource_id = azurerm_linux_virtual_machine.web.id
        operator           = "GreaterThan"
        threshold          = 75
        time_aggregation   = "Average"
        time_window        = "PT5M"
        time_grain         = "PT1M"  
        statistic          = "Average"
      }

      scale_action {
        direction = "Increase"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT5M"
      }
    }

    # Scale down when CPU usage falls below 30%
    rule {
      metric_trigger {
        metric_name        = "Percentage CPU"
        metric_resource_id = azurerm_linux_virtual_machine.web.id
        operator           = "LessThan"
        threshold          = 30
        time_aggregation   = "Average"
        time_window        = "PT5M"
        time_grain         = "PT1M"  
        statistic          = "Average"
      }

      scale_action {
        direction = "Decrease"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT5M"
      }
    }
  }
}

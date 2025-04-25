variable "varspi" {}

resource "azurerm_public_ip" "piblock" {
    for_each = var.varspi
  name                = each.value.piname
  resource_group_name = each.value.rgname
  location            = each.value.location
  allocation_method   = "Static"
}
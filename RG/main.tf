variable "varsrg" {}

resource "azurerm_resource_group" "rg-block" {
    for_each = var.varsrg
  name     = each.value.rgname
  location = each.value.location
}
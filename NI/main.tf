variable "varsni" {}
variable "datasnid" {}
variable "datapiid" {}

resource "azurerm_network_interface" "ni-block" {
    for_each = var.varsni
  name                = each.value.niname
  location            = each.value.location
  resource_group_name = each.value.rgname

  ip_configuration {
    name                          = each.value.ipname
    subnet_id                     = data.azurerm_subnet.datasnid[each.value].id
    private_ip_address_allocation = each.value.address_allocation
    public_ip_address_id = data.azurerm_public_ip.data-piid[each.value].id
  }
}

data "azurerm_subnet" "datasnid" {
    for_each = var.datasnid
  name                 = each.value.snname
  virtual_network_name = each.value.vnname
  resource_group_name  = each.value.rgname
}

data "azurerm_public_ip" "data-piid" {
    for_each = var.datapiid
  name                = each.value.piname
  resource_group_name = each.value.rgname
}
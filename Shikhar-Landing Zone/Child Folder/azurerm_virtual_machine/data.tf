data "azurerm_public_ip" "pips" {
    for_each = var.front_VM
    name = each.value.name
    resource_group_name = each.value.resource_group_name
}
data "azurerm_subnet" "subdata" {
    for_each = var.front_VM
    name = each.value.subnet_name
    virtual_network_name = each.value.VNET_name
    resource_group_name = each.value.resource_group_name
}
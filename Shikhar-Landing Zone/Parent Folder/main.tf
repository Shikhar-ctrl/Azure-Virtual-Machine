module "rg" {
  source = "../Child Folder/azurerm_resource_group"
  rgs    = var.rgs
}
module "vnet" {
  depends_on = [module.rg]
  source     = "../Child Folder/azurerm_virtual_network"
  vnet       = var.vnet
}
module "sub" {
  depends_on = [module.vnet]
  source     = "../Child Folder/azurerm_subnet"
  sub        = var.sub
}
module "pip" {
  depends_on = [module.sub]
  source     = "../Child Folder/azurerm_public_IP"
  pip        = var.pip
}
module "front_VM" {
  depends_on = [module.pip]
  source     = "../Child Folder/azurerm_virtual_machine"
  front_VM   = var.front_VM
}
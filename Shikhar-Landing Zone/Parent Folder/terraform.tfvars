rgs = {
  rg1 = {
    name     = "landingzone"
    location = "East US"
  }
}
vnet = {
  vnet1 = {
    name                = "frontend_VM"
    location            = "East US"
    resource_group_name = "landingzone"
    address_space       = ["10.143.0.0/16"]
  }
}
sub = {
  sub1 = {
    name                 = "frontend_subnet_1"
    resource_group_name  = "landingzone"
    virtual_network_name = "frontend_VM"
    address_prefixes     = ["10.143.0.0/24"]
  }
  sub2 = {
    name                 = "frontend_subnet_2"
    resource_group_name  = "landingzone"
    virtual_network_name = "frontend_VM"
    address_prefixes     = ["10.143.1.0/24"]
  }
}
pip = {
  pip1 = {
    name                = "pip_front_1"
    resource_group_name = "landingzone"
    location            = "East US"
    allocation_method   = "Static"
  }
  pip2 = {
    name                = "pip_front_2"
    resource_group_name = "landingzone"
    location            = "East US"
    allocation_method   = "Static"
  }
}
front_VM = {
  vm1 = {
    nic_name            = "front_1_NIC"
    name                = "pip_front_1"
    subnet_name         = "frontend_subnet_1"
    VNET_name           = "frontend_VM"
    location            = "East US"
    resource_group_name = "landingzone"
    vm_name             = "front1VMachine"
    size                = "Standard_DC2ds_v3"
    username            = "welcome"
    password            = "User@1234567890"
  }
  vm2 = {
    nic_name            = "front_2_NIC"
    name                = "pip_front_2"
    subnet_name         = "frontend_subnet_2"
    VNET_name           = "frontend_VM"
    location            = "East US"
    resource_group_name = "landingzone"
    vm_name             = "front2VMachine"
    size                = "Standard_DC2ds_v3"
    username            = "welcome"
    password            = "User@1234567890"
  }
}
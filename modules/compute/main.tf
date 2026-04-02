# modules/compute/main.tf

# random string for uniqueness
resource "random_string" "vm_suffix" {
	length  = 4
	upper = false
	numeric = true
	special = false
}

# local variable for the name guideline
locals {
	vm_name = "${var.env}-${var.prefix}-${var.location}-${random_string.vm_suffix.result}"
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = local.vm_name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = "Standard_B1ms"
  admin_username      = var.admin_username

  network_interface_ids           = [azurerm_network_interface.nic.id]
  admin_password                  = var.admin_password
  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

resource "azurerm_public_ip" "public_ip" {
  name                = "public-ip-demo"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
}


resource "azurerm_network_interface" "nic" {
  name                = "nic-demo"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
}


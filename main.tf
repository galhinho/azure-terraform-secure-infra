terraform {
	required_providers {
		random = {
			source = "hashicorp/random"
			version = "~> 3.0"
		}
	}
}


module "network" {
  source              = "./modules/network"
  location            = var.location
  resource_group_name = var.resource_group_name
}

module "compute" {
  source              = "./modules/compute"
  location            = var.location
  resource_group_name = var.resource_group_name
  prefix              = "vm"
  env                 = "dev"
  subnet_id           = module.network.subnet_id
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  depends_on          = [module.network]
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}
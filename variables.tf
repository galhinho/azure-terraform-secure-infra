variable "location" {
  description = "Azure region"
  type        = string
  default     = "West Europe"
}

variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
}

variable "vm_name" {
  description = "Virtual Machine name"
  type        = string
}

variable "env" {
  description = "Environment name (dev, prod, etc)"
  type        = string
  validation {
	condition   = contains(["dev", "test", "prod"], var.env)
	error_message = "Environment must be dev, test, or prod."
  }
}

variable "prefix" {
  description = "Project prefix"
  type        = string
}

variable "admin_username" {
  description = "Admin Username"
  type        = string
}

variable "admin_password" {
  description = "Admin password"
  type        = string
}
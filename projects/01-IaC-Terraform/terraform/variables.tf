variable "subscription_id" {
    description = "Azure Subscription ID"
    type        = string  
}

variable "tenant_id" {
    description = "Azure Tenant ID"
    type        = string
}

variable "resource_group_name" {
  description = "Azure Resource Group Name"
  type        = string
  default     = "devops-terraform-rg"
}

variable "location" {
  description = "Azure Region"
  type        = string
  default     = "UK South"
}

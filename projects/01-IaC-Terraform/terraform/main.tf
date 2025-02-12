module "network" {
  source              = "./modules/network"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "compute" {
  source              = "./modules/compute"
  resource_group_name = var.resource_group_name
  location            = var.location
  vnet_id             = module.network.vnet_id
  subnet_id           = module.network.web_subnet_id
}

module "database" {
  source              = "./modules/database"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "storage" {
  source              = "./modules/storage"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "load_balancer" {
  source              = "./modules/load_balancer"
  resource_group_name = var.resource_group_name
  location            = var.location
  backend_pool_id     = module.compute.backend_pool_id
}

module "auto_scaling" {
  source              = "./modules/auto_scaling"
  resource_group_name = var.resource_group_name
  location            = var.location
  vm_id               = module.compute.vm_id
}

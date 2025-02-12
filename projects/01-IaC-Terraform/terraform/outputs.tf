output "vm_public_ip" {
  description = "Public IP of the VM"
  value       = module.compute.public_ip
}

output "database_connection_string" {
  description = "Connection string for the database"
  value       = module.database.connection_string
}

output "load_balancer_ip" {
  description = "Public IP of the Load Balancer"
  value       = module.load_balancer.public_ip
}

output "kubeconfig-admin" {
  value = module.bootkube.kubeconfig-admin
}

# Outputs for Kubernetes Ingress

output "ingress_static_ipv4" {
  value       = azurerm_public_ip.ingress-ipv4.ip_address
  description = "IPv4 address of the load balancer for distributing traffic to Ingress controllers"
}

# Outputs for controllers

output "controller_public_ips" {
  description = "IPv4 addresses of the controller VMs (e.g. for SSH)"
  value       = azurerm_public_ip.controllers.*.ip_address
}

# Outputs for worker pools

output "region" {
  value = azurerm_resource_group.cluster.location
}

output "resource_group_name" {
  value = azurerm_resource_group.cluster.name
}

output "resource_group_id" {
  value = azurerm_resource_group.cluster.id
}

output "subnet_id" {
  value = azurerm_subnet.worker.id
}

output "security_group_id" {
  value = azurerm_network_security_group.worker.id
}

output "kubeconfig" {
  value = module.bootkube.kubeconfig-kubelet
}

output "worker_principal_id" {
  description = "The identity principal for the worker pool VMs"
  value       = module.workers.principal_id
}

# Outputs for custom firewalling

output "worker_security_group_name" {
  value = azurerm_network_security_group.worker.name
}

output "worker_address_prefix" {
  description = "Worker network subnet CIDR address (for source/destination)"
  value       = azurerm_subnet.worker.address_prefix
}

# Outputs for custom load balancing

output "loadbalancer_id" {
  description = "ID of the cluster load balancer"
  value       = azurerm_lb.cluster.id
}

output "backend_address_pool_id" {
  description = "ID of the worker backend address pool"
  value       = azurerm_lb_backend_address_pool.worker.id
}

output "backend_probe_id" {
  description = "ID of the worker backend health probe"
  value       = azurerm_lb_probe.ingress.id
}

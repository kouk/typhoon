# Kubernetes assets (kubeconfig, manifests)
module "bootstrap" {
  source = "git::https://github.com/poseidon/terraform-render-bootstrap.git?ref=10d9cec5c256f4622712bf01448df1a2befc37c8"

  cluster_name = var.cluster_name
  api_servers  = [format("%s.%s", var.cluster_name, var.dns_zone)]
  etcd_servers = digitalocean_record.etcds.*.fqdn
  asset_dir    = var.asset_dir

  networking = var.networking

  # only effective with Calico networking
  network_encapsulation = "vxlan"
  network_mtu           = "1450"

  pod_cidr              = var.pod_cidr
  service_cidr          = var.service_cidr
  cluster_domain_suffix = var.cluster_domain_suffix
  enable_reporting      = var.enable_reporting
  enable_aggregation    = var.enable_aggregation
}


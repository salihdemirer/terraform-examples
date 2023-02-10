resource "google_compute_network" "vpc_network" {
  name = var.vpc_network_name
  routing_mode = var.routing_mode
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "us-east1_subnet" {
    depends_on = [
      google_compute_network.vpc_network
    ]
  name = var.vpc_subnetwork_name
  ip_cidr_range = var.subnet
  region = var.region
  network = google_compute_network.vpc_network.id
  secondary_ip_range = [ {
    ip_cidr_range = var.pod_secondary_range
    range_name = var.pod_secondary_range_name
  } ,
  {
    ip_cidr_range = var.svc_secondary_range
    range_name = var.svc_secondary_range_name
  } 
  ]
}

resource "google_compute_firewall" "vpc_internal_allow" {
    depends_on = [
      google_compute_subnetwork.us-east1_subnet
    ]
  name = "vpc-internal-allow"
  network = google_compute_network.vpc_network.name
  description = "Allow internal traffic inside vpc-subnetwork"
  direction = "INGRESS"
  source_ranges = [ google_compute_subnetwork.us-east1_subnet.ip_cidr_range ]
  allow {
    protocol = "tcp"
    ports = ["0-65535"]
  }

  allow {
    protocol = "icmp"
  }

}

resource "google_compute_router" "vpc_network_router" {
  depends_on = [
    google_compute_subnetwork.us-east1_subnet
  ]
  name = var.network_router_name
  region = google_compute_subnetwork.us-east1_subnet.region
  network = google_compute_network.vpc_network.id
}

resource "google_compute_router_nat" "vpc_network_nat" {
  depends_on = [
    google_compute_subnetwork.us-east1_subnet
  ]
  name = var.network_nat_name
  router = google_compute_router.vpc_network_router.name
  region = google_compute_router.vpc_network_router.region
  nat_ip_allocate_option = "AUTO_ONLY" # NAT IP's allocated by GCP
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  subnetwork {
    name = google_compute_subnetwork.us-east1_subnet.self_link
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}
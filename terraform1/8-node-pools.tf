# Cluster 1 Definition
resource "google_container_cluster" "cluster3test" {
  name     = "cluster3test"
  location = "us-central1"

  # Cluster settings (e.g., networking, security, etc.)
}

# Node Pool for Cluster 1
resource "google_container_node_pool" "node_pool_cluster3test" {
  name       = "node-pool-cluster3test"
  cluster    = google_container_cluster.cluster3test.name
  node_count = 1

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  autoscaling {
    min_node_count = 1
    max_node_count = 5
  }

  node_config {
    preemptible  = false
    machine_type = "e2-medium"
    service_account = google_service_account.kubernetes.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}

# Cluster 2 Definition
resource "google_container_cluster" "cluster4" {
  name     = "cluster4"
  location = "us-central1"

  # Cluster settings (e.g., networking, security, etc.)
}

# Node Pool for Cluster 4
resource "google_container_node_pool" "node_pool_cluster4" {
  name       = "node-pool-cluster4"
  cluster    = google_container_cluster.cluster4.name
  node_count = 1

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  autoscaling {
    min_node_count = 1
    max_node_count = 5
  }

  node_config {
    preemptible  = false
    machine_type = "e2-medium"
    service_account = google_service_account.kubernetes.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}

# Google Service Account for Both Node Pools
resource "google_service_account" "kubernetes" {
  account_id = "kubernetes"
}

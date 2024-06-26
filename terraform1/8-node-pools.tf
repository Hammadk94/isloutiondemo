# Node Pool for Cluster 1
resource "google_container_node_pool" "node_pool_cluster1" {
  name       = "node-pool-cluster1"
  cluster    = google_container_cluster.cluster1.name
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
    machine_type = "e2-small"
    service_account = google_service_account.kubernetes.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}

# Node Pool for Cluster 2
resource "google_container_node_pool" "node_pool_cluster2" {
  name       = "node-pool-cluster2"
  cluster    = google_container_cluster.cluster2.name
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
    machine_type = "e2-small"
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

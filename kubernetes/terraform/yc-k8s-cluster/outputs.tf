output "cluster_external_v4_endpoint" {
  value = yandex_kubernetes_cluster.yc-test-cluster.master.0.external_v4_endpoint
}

output "yc-test-node-group_status" {
  value = yandex_kubernetes_node_group.yc-test-node-group.status
}

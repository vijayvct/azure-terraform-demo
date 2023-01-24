output "storage1_name" {
  value="${var.storage_account_name}${random_id.storage_id.dec}"
  description = "Storage Account Details"
}


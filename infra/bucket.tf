# Create a random id for bucket name uniqueness.
resource "random_id" "bucket_id"{
    byte_length = 4
}

# Python app will list objects in this bucket.
resource "google_storage_bucket" "app_bucket" {
  name = "app-bucket-${random_id.bucket_id.hex}"
  location = var.region
  storage_class = var.storage_class
  public_access_prevention = var.public_access_prevention
}

locals {
  sufix="${var.tags.Project}-${var.tags.env}-${var.tags.region}"
}

resource "random_string" "s3_bucket_suffix" {
  length  = 8
  special = false
  upper   = false
}

locals {
  s3_bucket_name = "${var.tags.Project}-${random_string.s3_bucket_suffix.id}"
}
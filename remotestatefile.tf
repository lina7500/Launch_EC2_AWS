terraform {
  backend "s3" {
    bucket = "lintfstatebucket"
    key = "global/s3/dev/terraform.tfstate"
    region = "${var.region_name}"
    encrypt = true
  }
}
resource "aws_s3_bucket" "terraform_state" {
  bucket = "lintfstatebucket"
  lifecycle {
    prevent_destroy = true
  }
  /*
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }*/
}


resource "aws_s3_bucket" "practica_bucket" {
  bucket = local.s3_bucket_name
}
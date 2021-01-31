
  // Criando um bucket
resource "aws_s3_bucket" "bucket_dev" {
  bucket = "marcos-bucket_dev"
  acl    = "private"

  tags = {
    Name = "marcos-bucket_dev"
  }
}

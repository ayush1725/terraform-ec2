resource "aws_s3_bucket" "remote_s3" {
  bucket = "tws-junoon-state-bucket-ayush"

  tags = {
    Name        = "tws-junoon-state-bucket-ayush"
  }
}
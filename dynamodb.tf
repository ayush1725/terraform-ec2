resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "tws-junoon-state-table"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Name        = "tws-junoon-state-table"
  }
}
resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket = var.state_bucket_name
  acl    = "private"
}

resource "aws_dynamodb_table" "terraform_state_lock" {
  name           = "terraform-state-lock"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "id"
  read_capacity  = 5
  write_capacity = 5

  attribute {
    name = "id"
    type = "N"
  }

  attribute {
    name = "name"
    type = "S"
  }
}

terraform {
  backend "s3" {
    bucket         = aws_s3_bucket.terraform_state_bucket.id
    key            = "terraform.tfstate"
    region         = var.env_region
    dynamodb_table = aws_dynamodb_table.terraform_state_lock.name
  }
}

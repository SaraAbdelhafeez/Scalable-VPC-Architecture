resource "aws_s3_bucket" "application_bucket" {
  bucket = "application-bucket"  
  acl    = "private" 

  versioning {
    enabled = true  # Enable versioning for the bucket
  }

  tags = {
    Name = "application-bucket"
  }

  lifecycle {
    prevent_destroy = true  # Prevent accidental deletion of the bucket
  }
}

resource "aws_s3_bucket_object" "apache_object" {
  bucket = aws_s3_bucket.application_bucket.id
  key    = "index.html" 
  source = "../index.html"

  acl = "private"  
}

resource "aws_s3_bucket_object" "ansible_object" {
  bucket = aws_s3_bucket.application_bucket.id
  key    = "playbook.yml" 
  source = "../playbook.yml"

  acl = "private"  
}

resource "aws_s3_bucket_object" "metrics_object" {
  bucket = aws_s3_bucket.application_bucket.id
  key    = "amazon-cloudwatch-agent.json" 
  source = "../amazon-cloudwatch-agent.json"

  acl = "private"  
}
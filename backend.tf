terraform {
  backend "s3" {
    bucket         = "nairobi-s3bucket" 
    key            = "terraform.tfstate"
    region         = "us-east-1" 
    encrypt        = true
    dynamodb_table = "terraform-state-lock-dynamo"
  }
}

resource "aws_dynamodb_table" "terraform_state_lock" {
  name           = "my-terraform-state-lock-dynamo"
  billing_mode ="PAY_PER_REQUEST"
  hash_key       = "LockID"
  
  attribute {
    name = "LockID"
    type = "S"
  }
}


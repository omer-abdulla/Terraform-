provider "aws" {
  region = "us-east-1"
}

resource "aws_sns_topic" "example" {
  name = "example-topic" 
}

resource "aws_lambda_function" "example" {
  function_name = "example-lambda"

  # runtime, role etc

  triggers = {
    example-trigger = aws_sns_topic.example.arn
  }
}

resource "aws_dynamodb_table" "example" {
  name           = "example-table"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "Id"

  attribute {
    name = "Id" 
    type = "S"
  }
}
# Terraform

# SNS Topic
resource "aws_sns_topic" "my_topic" {
  name = "my-topic"
}

# Lambda Function
resource "aws_lambda_function" "my_function" {
  function_name    = "my-function"
  runtime          = "python3.7"
  handler          = "index.handler"

  s3_bucket        = "my-bucket"
  s3_key           = "my-function.zip"

  source_arn       = aws_sns_topic.my_topic.arn
}

# DynamoDB Table
resource "aws_dynamodb_table" "my_table" {
  name             = "my-table"
  read_capacity    = 5
  write_capacity   = 5
  hash_key         = "id"

  attribute {
    name = "id"
    type = "S" 
  }
}

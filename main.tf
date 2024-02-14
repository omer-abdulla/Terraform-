# main.tf

# Create SNS topic
resource "aws_sns_topic" "my_topic" {
  name = "my-topic"
}

# Create Lambda function subscribed to SNS topic
resource "aws_lambda_function" "my_function" {
  function_name = "my-function"

  s3_bucket = "my-bucket"
  s3_key    = "my-function.zip"

  handler = "index.handler"
  runtime = "python3.7"

  source_arn = aws_sns_topic.my_topic.arn
}

# Create DynamoDB table
resource "aws_dynamodb_table" "my_table" {
  name           = "my-table"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "id"

  attribute {
    name = "id"
    type = "S"
  }
}

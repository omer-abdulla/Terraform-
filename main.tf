provider "aws" {
  region = "us-east-1"  # Update with your desired AWS region
}

resource "aws_iam_role" "lambda_role" {
  name = "lambda_execution_role"
  
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
        Action    = "sts:AssumeRole"
      },
    ]
  })
  
  # Define additional IAM policies as needed
}

resource "aws_lambda_function" "example_lambda" {
  function_name = "example_lambda_function"
  handler       = "index.handler"
  runtime       = "nodejs14.x"
  role          = aws_iam_role.lambda_role.arn

  # Define the Lambda function code here
  # e.g., source_code_hash = filebase64("path/to/lambda_function.zip")
}

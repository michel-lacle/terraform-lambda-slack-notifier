provider "archive" {}

data "archive_file" "slack_lambda_file" {
  type = "zip"

  source_file = "notify_slack.py"
  output_path = "notify_slack.zip"
}

resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_function" "test_lambda" {
  filename      = "notify_slack.zip"
  function_name = "terraform-slack-notifier"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "notify_slack.send_message"

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
  source_code_hash = filebase64sha256("notify_slack.zip")

  runtime = "python3.7"

  environment {
    variables = {
      foo = "bar"
    }
  }

  depends_on = [data.archive_file.slack_lambda_file]
}

data "archive_file" "email_lambda_file" {
  type = "zip"

  source_file = "notify_email.py"
  output_path = "notify_email.zip"
}

resource "aws_iam_role" "iam_for_email_lambda" {
  name = "iam_for_email_lambda"

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

resource "aws_lambda_function" "email_lambda" {
  filename      = "notify_email.zip"
  function_name = "terraform-email-notifier"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "notify_email.send_message"

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
  source_code_hash = filebase64sha256("notify_email.zip")

  runtime = "python3.7"

  environment {
    variables = {
      EMAIL_TOPIC_ARN = aws_sns_topic.email-topic.arn
    }
  }

  depends_on = [data.archive_file.email_lambda_file]
}

resource "aws_sns_topic" "slack-notifier" {
  name = "slack-notifier-tf"
}

resource "aws_sns_topic_subscription" "slack-lambda-notification-subscription" {
  topic_arn = aws_sns_topic.slack-notifier.arn
  protocol  = "lambda"
  endpoint  = aws_lambda_function.test_lambda.arn
}

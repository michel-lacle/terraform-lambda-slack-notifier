resource "aws_sns_topic" "slack-notifier" {
  name = "slack-notifier-tf"
}

resource "aws_sns_topic_subscription" "slack-lambda-notification-subscription" {
  topic_arn = aws_sns_topic.slack-notifier.arn
  protocol  = "lambda"
  endpoint  = aws_lambda_function.slack_lambda.arn
}

# allow sns to trigger our lambda
resource "aws_lambda_permission" "sns-slack-trigger" {
  statement_id  = "AllowExecutionFromSNS"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.slack_lambda.function_name
  principal     = "sns.amazonaws.com"
  source_arn    = aws_sns_topic.slack-notifier.arn
}
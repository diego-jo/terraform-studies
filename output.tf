output "sns_arn" {
  value = aws_sns_topic.certificate-monitor-2.arn
}

output "sns_subscriptions" {
  value = aws_sns_topic_subscription.email-subscription
}
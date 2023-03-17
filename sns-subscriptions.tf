resource "aws_sns_topic_subscription" "email-subscription" {
    topic_arn = aws_sns_topic.certificate-monitor-2.arn
    protocol = "email"
    for_each = toset(var.emails)
    endpoint = each.value
}
resource "aws_cloudwatch_event_rule" "certificate-monitor-2" {
  name = "certificate-monitor-2"
  depends_on = [aws_sns_topic.certificate-monitor-2]

  event_pattern = jsonencode({
    detail-type = [
      "ACM Certificate Approaching Expiration"
    ]
    source: ["aws.acm"]
  })
}

resource "aws_cloudwatch_event_target" "sns_event_target" {
  target_id = "SendToSNS"
  arn = aws_sns_topic.certificate-monitor-2.arn
  rule = aws_cloudwatch_event_rule.certificate-monitor-2.id

  input_transformer {
    input_paths = {
      "account" = "$.account",
      "region": "$.region"
    }

    input_template = "\"Testando a <account>\\nna regiao <region> para validações.\""
  }
}
resource "aws_sns_topic" "demo_sns" {
  name = "demo_sns"
}

resource "aws_sqs_queue" "demo_queue" {
  name                      = "demo_queue"
  delay_seconds             = 90
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10
#  redrive_policy = jsonencode({
#    deadLetterTargetArn = aws_sqs_queue.demo_queue_deadletter.arn
#    maxReceiveCount     = 4
#  })

  tags = {
    Environment = "Test"
  }
}

resource "aws_sns_topic_subscription" "sqs_target" {
  topic_arn = aws_sns_topic.demo_sns.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.demo_queue.arn
}

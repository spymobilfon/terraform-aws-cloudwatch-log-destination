output "cloudwatch_log_destination_arn" {
  description = "ARN of AWS CloudWatch Log Destination"
  value = merge(
    { for i in aws_cloudwatch_log_destination.kinesis_stream : i.name => i.arn },
    { for i in aws_cloudwatch_log_destination.kinesis_firehose_s3 : i.name => i.arn },
  )
}

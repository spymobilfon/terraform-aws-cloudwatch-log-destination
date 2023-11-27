resource "aws_cloudwatch_log_destination" "kinesis_stream" {
  for_each   = toset(var.services)
  name       = "${each.key}_kinesis_stream_${data.aws_region.current.name}"
  role_arn   = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/cloudwatch-logs-to-kinesis-stream-role"
  target_arn = "arn:aws:kinesis:${var.central_storage_region}:${data.aws_caller_identity.current.account_id}:stream/${each.key}_kinesis_stream"
  tags = merge(
    var.tags,
    { CreatedBy = "terraform" }
  )
}

resource "aws_cloudwatch_log_destination" "kinesis_firehose_s3" {
  for_each   = toset(var.services)
  name       = "${each.key}_kinesis_firehose_s3_${data.aws_region.current.name}"
  role_arn   = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/cloudwatch-logs-to-kinesis-firehose-role"
  target_arn = "arn:aws:firehose:${var.central_storage_region}:${data.aws_caller_identity.current.account_id}:deliverystream/${each.key}_kinesis_firehose_s3"
  tags = merge(
    var.tags,
    { CreatedBy = "terraform" }
  )
}

resource "aws_cloudwatch_log_destination_policy" "kinesis_stream_policy" {
  for_each         = toset(var.services)
  destination_name = aws_cloudwatch_log_destination.kinesis_stream[each.key].name
  access_policy    = data.aws_iam_policy_document.cloudwatch_log_destination_policy[each.key].json
}

resource "aws_cloudwatch_log_destination_policy" "kinesis_firehose_s3_policy" {
  for_each         = toset(var.services)
  destination_name = aws_cloudwatch_log_destination.kinesis_firehose_s3[each.key].name
  access_policy    = data.aws_iam_policy_document.cloudwatch_log_destination_policy[each.key].json
}

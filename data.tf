data "aws_organizations_organization" "current" {}
data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

data "aws_iam_policy_document" "cloudwatch_log_destination_policy" {
  for_each = toset(var.services)
  statement {
    effect = "Allow"
    principals {
      type        = "*"
      identifiers = ["*"]
    }
    actions = [
      "logs:PutSubscriptionFilter",
    ]
    resources = [
      aws_cloudwatch_log_destination.kinesis_stream[each.key].arn,
      aws_cloudwatch_log_destination.kinesis_firehose_s3[each.key].arn,
    ]
    condition {
      test     = "StringEquals"
      variable = "aws:PrincipalOrgID"
      values   = [data.aws_organizations_organization.current.id]
    }
  }
}

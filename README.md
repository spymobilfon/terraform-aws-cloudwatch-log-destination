# AWS CloudWatch Log Destination Terraform module

Terraform module which creates AWS CloudWatch Log Destination into AWS Organization per service with targets in AWS Kinesis Stream and AWS Kinesis Firehose S3

## Usage

```hcl
module "cloudwatch_log_destination" {
  source                 = "spymobilfon/cloudwatch-log-destination/aws"
  services               = ["eks", "ec2"]
  central_storage_region = "eu-west-1"
}
```

## Examples
- [Complete](examples/complete/): Create AWS CloudWatch Log Destination for EKS and EC2 with central storage in eu-west-1

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->

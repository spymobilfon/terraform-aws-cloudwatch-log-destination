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
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.8 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.67.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.67.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_destination.kinesis_firehose_s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_destination) | resource |
| [aws_cloudwatch_log_destination.kinesis_stream](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_destination) | resource |
| [aws_cloudwatch_log_destination_policy.kinesis_firehose_s3_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_destination_policy) | resource |
| [aws_cloudwatch_log_destination_policy.kinesis_stream_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_destination_policy) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.cloudwatch_log_destination_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_organizations_organization.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/organizations_organization) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_central_storage_region"></a> [central\_storage\_region](#input\_central\_storage\_region) | AWS region where located central storage for logging or central endpoint for logging. | `string` | `"eu-central-1"` | no |
| <a name="input_services"></a> [services](#input\_services) | List of services for logging. | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the resources. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudwatch_log_destination_arn"></a> [cloudwatch\_log\_destination\_arn](#output\_cloudwatch\_log\_destination\_arn) | ARN of AWS CloudWatch Log Destination |
<!-- END_TF_DOCS -->

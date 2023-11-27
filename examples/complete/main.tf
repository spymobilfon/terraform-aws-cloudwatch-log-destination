module "cloudwatch_log_destination" {
  source                 = "../.."
  services               = ["eks", "ec2"]
  central_storage_region = "eu-west-1"
}

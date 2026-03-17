locals {
  ami_id = data.aws_ami.joindevops.id
  common_tags = {
    Project     = var.project
    Environment = var.environment
    Terraform   = "true"
  }
  mongodb_subnet_id = split(",", data.aws_ssm_parameter.mongodb_subnet_ids.value)[0]
  mongodb_sg_id     = data.aws_ssm_parameter.mongodb_sg_id.value
}
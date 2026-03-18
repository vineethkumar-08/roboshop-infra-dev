locals {
  backend_alb_sg_id = data.aws_ssm_parameter.backend_alb_sg_id.value
  private_sg_ids = split(",",data.aws_ssm_parameter.private_sg_ids.value)
    common_tags = {
        Project = var.project
        Environment = var.environment
        Terraform = "true"
    }
} 
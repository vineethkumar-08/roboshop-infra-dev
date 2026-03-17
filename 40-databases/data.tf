data "aws_ami" "joindevops" {
  most_recent = true
  owners      = ["973714476881"]

  filter {
    name   = "name"
    values = ["Redhat-9-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_ssm_parameter" "mongodb_subnet_ids" {
  name = "/${var.project}/${var.environment}/database_subnet_ids"
}

data "aws_ssm_parameter" "mongodb_sg_id" {
  name = "/${var.project}/${var.environment}/mongodb_sg_id"
}

data "aws_instances" "bastion" {
  filter {
    name   = "tag:Name"
    values = ["${var.project}-${var.environment}-bastion"]
  }

  filter {
    name   = "instance-state-name"
    values = ["running"]
  }
}

data "aws_instance" "bastion" {
  instance_id = tolist(data.aws_instances.bastion.ids)[0]
}

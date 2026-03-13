resource "aws_security_group_rule" "bastian_internet" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  # cidr_blocks       = "0.0.0.0/0"
  cidr_blocks       = [local.my_ip]
  # which sg you are creating this rule
  security_group_id = local.bastion_sg_id
}

resource "aws_security_group_rule" "mongodb_bastian" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  # where source of traffic is comming from = its comming from bastian
  source_security_group_id = local.bastion_sg_id
  security_group_id = local.mongodb_sg_id
}

resource "aws_security_group_rule" "mongodb_catalogue" {
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  source_security_group_id = local.catalogue_sg_id
  security_group_id = local.mongodb_sg_id
}

resource "aws_security_group_rule" "mongodb_user" {
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  source_security_group_id = local.user_sg_id
  security_group_id = local.mongodb_sg_id
}
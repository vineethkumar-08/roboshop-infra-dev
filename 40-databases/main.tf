resource "aws_instance" "mongodb" {
  ami                    = local.ami_id
  instance_type          = "t3.micro"
  subnet_id              = local.mongodb_subnet_id
  vpc_security_group_ids = [local.mongodb_sg_id]
  #   iam_instance_profile = aws_iam_instance_profile.mongodb.name

  tags = merge(
    {
      Name = "${var.project}-${var.environment}-mongodb"
    },
    local.common_tags
  )
}


resource "terraform_data" "bootstrap" {
  triggers_replace = [
    aws_instance.mongodb.id,
  ]
  connection {
    type             = "ssh"
    user             = "ec2-user"
    password         = "DevOps321"
    host             = aws_instance.mongodb.private_ip
    bastion_host     = data.aws_instance.bastion.public_ip
    bastion_user     = "ec2-user"
    bastion_password = "DevOps321"
  }

  provisioner "file" {
    source      = "bootstrap.sh"      # local file path in our database file
    destination = "/tmp/bootstrap.sh" # destination path on the remote machhine/copying tmp.boothstrap.sh
  }


  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/bootstrap.sh",
      "sudo sh /tmp/bootstrap.sh mongodb ${var.environment}"
    ]
  }
}

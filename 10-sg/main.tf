module "sg" {
    count = length(var.sg_names)
    source = "git::https://github.com/vineethkumar-08/terraform-sg-module.git?ref=main"
    project = var.project
    environment = var.environment
    sg_name = replace(var.sg_names[count.index], "_", "-")
    vpc_id = local.vpc_id
}
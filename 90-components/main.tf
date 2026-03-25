module "component" {
    for_each = var.component
    source = "git::https://github.com/vineethkumar-08/terraform-component-module.git?ref=main"
    component = each.key
    rule_priority = each.value.rule_priority
}
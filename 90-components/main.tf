module "component" {
    for_each = var.components
    source = "git::https://github.com/vineethkumar-08/terraform-component-module.git?ref=main"
    components = each.key
    rule_priority = each.value.rule_priority
}
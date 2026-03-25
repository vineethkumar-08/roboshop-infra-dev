variable "component" {
  
  default = {
    # these are  attaching to backend_alb
    catalogue = {
        rule_priority = 10
    }
    # user = {
    #     rule_priority = 20 
    # }
    
    # cart = {
    #     rule_priority = 30
    # }

    # shipping ={
    #     rule_priority = 40
    # }

    # payment = {
    #     rule_priority = 50
    # }
    #frontend is attaching to frontend_alb,there is only one component there
    frontend = {
        rule_priority = 10
    }

  }
}


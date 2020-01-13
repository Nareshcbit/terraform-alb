variable "vpc_id" {}
variable "subnets" {}

variable "create_lb" {
  default     = true
}

variable "name" {
  default     = "myalb"
}


variable "load_balancer_type" {
  default     = "application"
}

variable "internal" {
  default     = false
}



variable "security_group_ids" {
  default     = ""
}


variable "enable_cross_zone_load_balancing" {
  default     = false
}

variable "enable_deletion_protection" {
  default     = false
}

variable "enable_http2" {
  default     = true
}


variable "load_balancer_create_timeout" {
  default     = "10m"
}

variable "load_balancer_update_timeout" {
  default     = "10m"
}

variable "load_balancer_delete_timeout" {
  default     = "10m"
}


variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "target_groups" {
  description = "A list of maps containing key/value pairs that define the target groups to be created. Order of these maps is important and the index of these are to be referenced in listener definitions. Required key/values: name, backend_protocol, backend_port. Optional key/values are in the target_groups_defaults variable."
  type        = any
  default     = [
    {
      name_prefix      = "http"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
    },
    {
      name_prefix      = "https"
      backend_protocol = "HTTPS"
      backend_port     = 443
      target_type      = "instance"
    }
  ]
}

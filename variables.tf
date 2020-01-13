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

variable "subnets" {}

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

provider "aws"{
  region = "ap-south-1"
}


terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "terraform-nxgcloud-infra-development"
    key            = "global/infra/alb-dev.tfstate"
    region         = "ap-south-1"
  }
}

resource "aws_lb" "this" {
  count = var.create_lb ? 1 : 0

  name        = var.name

  load_balancer_type = var.load_balancer_type
  internal           = var.internal
  security_groups    = var.security_group_ids == "" ? [] : split(",", var.security_group_ids)
  subnets            = split(",", var.security_group_ids)

  idle_timeout                     = var.idle_timeout
  enable_cross_zone_load_balancing = var.enable_cross_zone_load_balancing
  enable_deletion_protection       = var.enable_deletion_protection
  enable_http2                     = var.enable_http2

  tags = merge(
    var.tags,
    {
      Name = var.name
    },
  )

  timeouts {
    create = var.load_balancer_create_timeout
    update = var.load_balancer_update_timeout
    delete = var.load_balancer_delete_timeout
  }
}

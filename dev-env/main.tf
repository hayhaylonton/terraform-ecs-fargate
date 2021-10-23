terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "ap-southeast-1"
}

module "network" {
  source = "./modules/network"
}
module "ecs_cluster" {
  source = "./modules/ecs_cluster"
}

module "load_balancer" {
  source = "./modules/load_balancer"
  vpc_id = module.network.vpc_id
  subnet_public = module.network.subnet_public
  depends_on = [
    module.network,module.ecs_cluster
  ]
}

module "apps" {
  source = "./modules/apps"
  app_count=1
  vpc_id = module.network.vpc_id
  security_group_id = module.load_balancer.security_group_id
  ecs_cluster_id = module.ecs_cluster.ecs_cluster_id
  lb_listener=module.load_balancer.lb_listener
  target_group_id = module.load_balancer.target_group_id
  subnet_private = module.network.subnet_private
  depends_on = [
    module.network,module.ecs_cluster,module.load_balancer
  ]
}

output "load_balancer_ip" {
  value = module.load_balancer.lb_dns_name
}
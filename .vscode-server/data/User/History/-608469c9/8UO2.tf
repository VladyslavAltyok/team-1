output "vpc_id" {
    value = module.vpc.vpc_id
  
}

output "public_subnet_count" {
    value = length(module.subnets.subnet_id)
  
}

output "private_subnet_count" {
    value = length(module.subnets.subnet_id)
  
}

output "IGW_id" {
    value = module.aws
}
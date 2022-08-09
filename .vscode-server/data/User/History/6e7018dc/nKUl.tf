variable "vpc_name" {
  description = "Provide vpc name"
  type = string
  default = ""
  
}

variable "region" {
  description = "Please provide a region"
  type        = string
  default     = ""
}

variable "availability_zone" {
  description = "Provide availability zone"
  type = string
  default = ""
  
}
variable "cidr_block" {
  description = "Please provide CIDR block for VPC"
  type        = string
  default     = ""
}
variable "region" {
  description = "Please provide a region name"
  type        = string
}
variable "tags" {
  description = "Please provide a tag for resources"
  type        = map(any)
  default     = {}
}
variable "public-1" {
  description = "Please provide subnet CIDR block"
  type        = string
  default     = "10.0.101.0/24"
}
variable "public-2" {
  description = "Please provide subnet CIDR block"
  type        = string
  default     = "10.0.102.0/24"
}
variable "public-3" {
  description = "Please provide subnet CIDR block"
  type        = string
  default     = "10.0.103.0/24"
}
variable "private-1" {
  description = "Please provide subnet CIDR block"
  type        = string
  default     = "10.0.1.0/24"
}
variable "private-2" {
  description = "Please provide subnet CIDR block"
  type        = string
  default     = "10.0.2.0/24"
}
variable "private-3" {
  description = "Please provide subnet CIDR block for private-3"
  type        = string
  default     = "10.0.3.0/24"
}
variable "enable_nat_gateway" {
  description = "Should be true if you want to provision NAT Gateways for each of your private networks"
  type        = bool
  default     = false
}

variable "enableDnsHostnames" {
  description = "enableDnsHostnames"
  type        = bool
  default     = true
}
variable "vpc_name" {
  description = "Provide vpc name"
  type = string
  default = ""
  
}

variable "region" {
  
}

variable "availability_zone" {
  description = "Provide availability zone"
  
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
  default     = ""
}
variable "public-2" {
  description = "Please provide subnet CIDR block"
  type        = string
  default     = ""
}
variable "public-3" {
  description = "Please provide subnet CIDR block"
  type        = string
  default     = ""
}
variable "private-1" {
  description = "Please provide subnet CIDR block"
  type        = string
  default     = ""
}
variable "private-2" {
  description = "Please provide subnet CIDR block"
  type        = string
  default     = ""
}
variable "private-3" {
  description = "Please provide subnet CIDR block for private-3"
  type        = string
  default     = ""
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
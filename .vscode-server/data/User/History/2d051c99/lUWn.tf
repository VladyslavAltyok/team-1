variable "aws_regions" {
  description = "AWS region"
  type        = string
  default = "eu-west-2"
}

variable "cluster_id" {
  description = "The RDS cluster identifier"
  type        = string
  default     = "aurora-cluster-wordpress"
}

variable "engine" {
  description = "The name of database engine for RDS cluster"
  type        = string
  default     = "aurora-mysql"
}

variable "engine_version" {
  description = "The database engine version"
  type        = string
  default     = "5.7.mysql_aurora.2.03.2"
}

variable "db_name" {
  description = "The name of database"
  type        = string
  default     = "mysqldatabase"
}

variable "master_username" {
  description = "RDS master username"
  type        = string
  default     = "dbadmin"
}

variable "master_password" {
  description = "RDS master password - minimum 8 characters"
  type        = string
  default     = "dbpassword"
}

variable "instance_class" {
  description = "The instance class for the reader and writer"
  type        = string
  default     = "db.t2.small"
}

variable "availability_zones" {
  description = "Availability zones of AZ"
  type        = list(string)
  default     = [
       "eu-west-2a",
       "eu-west-2b",
       "eu-west-2c",
  ]
}

variable "ZONEID" {
  description = "Hosted Zone ID"
  type        = string
  default     = "Z08986893U1AWC562QW2Q"
}

variable "DOMAIN" {
  description = "Domain name"
  type        = string
  default     = "kudratillo.org"
}
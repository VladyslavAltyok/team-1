resource "aws_db_security_group" "default" {
  name = "rds_sg"
  vpc_id = var.vpc_id
  
  ingress {
    cidr = "10.0.0.0/24"

  }
}

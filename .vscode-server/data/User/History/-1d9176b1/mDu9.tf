resource "aws_rds_cluster" "wordpress" {
  cluster_identifier                  = var.cluster_id
  engine                              = var.engine
  engine_version                      = var.engine_version
  database_name                       = var.db_name
  master_username                     = var.master_username
  master_password                     = var.master_password
  skip_final_snapshot                 = true
  db_subnet_group_name                = aws_db_subnet_group.db_subnet.name
  vpc_security_group_ids              = [aws_security_group.db_security.id]
  backup_retention_period             = 5
  storage_encrypted                   = true
  availability_zones                  = var.availability_zones
}
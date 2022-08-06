output "rds_cluster_id" {
    description = "RDS cluster id"
    value = aws_rds_cluster.primary.id
}

output "rds_cluster_arn" {
    description = "RDS cluster arn"
    value = aws_rds_cluster.primary.arn
}

output "rds_cluster_endpoint" {
    description = "RDS cluster endpoint"
    value = aws_rds_cluster.primary.endpoint
}

output "rds_cluster_engine" {
    description = "RDS cluster engine"
    value = aws_rds_cluster.primary.engine
}

output "rds_cluster_engine_version" {
    description = "RDS cluster engine version currently running"
    value = aws_rds_cluster.primary.engine_version_actual
}

output "rds_cluster_db_name" {
    description = "RDS cluster database name"
    value = aws_rds_cluster.primary.database_name
}

output "rds_cluster_username" {
    description = "RDS cluster master username"
    value = aws_rds_cluster.primary.master_username
}

output "rds_cluster_password" {
    description = "RDS cluster master password"
    value = aws_rds_cluster.primary.master_password
}

output "rds_cluster_hz_id" {
    description = "RDS cluster hosted zone id"
    value = aws_rds_cluster.primary.hosted_zone_id
}

output "rds_cluster_retention" {
    description = "RDS cluster backup retention windoes"
    value = aws_rds_cluster.primary.backup_retention_period
}
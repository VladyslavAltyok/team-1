resource "aws_rds_cluster" "reader1" {
    cluster_identifier = "reader1"
    engine = "aurora-mysql"
    availability_zones = var.availability_zone
    database_name = "mydb"
    master_username = "team1"
    master_password = "project"
    

}
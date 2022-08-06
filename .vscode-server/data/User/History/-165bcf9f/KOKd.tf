# resource "aws_db_subnet_group" "default" {
#   name       = "main"
#   subnet_ids = [aws_subnet.frontend.id, aws_subnet.backend.id]
# }

resource "aws_default_subnet" "default_az1" {
  availability_zone = "us-east-1a"

}
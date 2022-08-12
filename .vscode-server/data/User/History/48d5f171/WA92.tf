
resource "aws_launch_template" "name" {
  
}

resource "aws_autoscaling_group" "team1_asg" {
    name = "test-asg"
    max_size = 99
    min_size = 1
    desired_capacity = 1
    health_check_grace_period = 300
    health_check_type = "ELB"
    vpc_zone_identifier = [aws_subnet.public-1.id, aws_subnet.public-2.id, aws_subnet.public-3.id ]

}
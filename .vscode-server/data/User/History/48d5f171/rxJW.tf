
resource "aws_launch_template" "team1-lt" {
    name = "team1"

  
}

resource "aws_autoscaling_group" "team1_asg" {
    name = "test-asg"
    max_size = 99
    min_size = 1
    desired_capacity = 1
    health_check_grace_period = 300
    health_check_type = "EC2"
    vpc_zone_identifier = [aws_subnet.public-1.id, aws_subnet.public-2.id, aws_subnet.public-3.id ]
    availability_zones  = data.aws_availability_zones.all.names 

}
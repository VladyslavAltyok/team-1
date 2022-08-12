resource "aws_launch_template" "launch-template-team1" {
    name = "launch-template-team1"
    description = "Launch template for ASG team1"
    update_default_version = true
    image_id = "ami-090fa75af13c156b4"
    instance_type = "t3.micro"
    ebs_optimized = true 
    user_data = filebase64("/home/ec2-user/step3/userdata.sh")

  
}

resource "aws_autoscaling_group" "team1_asg" {
    name = "test-asg"
    max_size = 99
    min_size = 1
    desired_capacity = 1
    health_check_grace_period = 300
    health_check_type = "EC2"
    vpc_zone_identifier = [aws_subnet.public-1.id, aws_subnet.public-2.id, aws_subnet.public-3.id ]
    launch_template {
      id = aws_launch_template.launch-template-team1.id
    }
}


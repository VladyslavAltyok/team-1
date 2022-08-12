# Pull all AZ from this region
data "aws_availability_zones" "all" {}

# This pulls AMI from your aws account
# data "aws_ami" "packer" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["ami-for-team1"]
#   }

#   owners = ["972559840749"] # Put your aws account id
# }

module "asg" {
  source = "terraform-aws-modules/autoscaling/aws"
  name   = "Team1-asg"

  min_size                  = 1
  max_size                  = 99
  desired_capacity          = 1
  wait_for_capacity_timeout = 0
  health_check_type         = "EC2"
  availability_zones        = data.aws_availability_zones.all.names # Use all AZs from this region

  # Launch template
  launch_template_name        = "launch-template-team1"
  launch_template_description = "Launch template for ASG team1"
  update_default_version      = true

  image_id          = "ami-090fa75af13c156b4" #data.aws_ami.packer.id # This uses AMI found under your account
  instance_type     = "t3.micro"
  ebs_optimized     = true
  enable_monitoring = true
  user_data         = filebase64("/home/ec2-user/asg-team1/userdata.sh")

}
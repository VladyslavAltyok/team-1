resource "aws_launch_template" "launch-template-team1" {
    name = "launch-template-team1"
    description = "Launch template for ASG team1"
    update_default_version = true
    image_id = "ami-090fa75af13c156b4"
    instance_type = "t3.micro"
    ebs_optimized = true 
    user_data = << EOF
                #! /bin/bash
                sudo yum install httpd php php-mysql -y -q
                sudo cd /var/www/html
                echo "Welcome" > hi.html
                sudo wget https://wordpress.org/wordpress-5.1.1.tar.gz
                sudo tar -xzf wordpress-5.1.1.tar.gz
                sudo cp -r wordpress/* /var/www/html/
                sudo rm -rf wordpress
                sudo rm -rf wordpress-5.1.1.tar.gz
                sudo chmod -R 755 wp-content
                sudo chown -R apache:apache wp-content
                sudo wget https://s3.amazonaws.com/bucketforwordpresslab-donotdelete/htaccess.txt
                sudo mv htaccess.txt .htaccess
                sudo systemctl start httpd
                sudo systemctl enable httpd 
        EOF

  
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


resource "aws_launch_template" "launch-template-team1" {
    name = "launch-template-team1"
    description = "Launch template for ASG team1"
    update_default_version = true
    image_id = "ami-090fa75af13c156b4"
    instance_type = "t3.micro"
    ebs_optimized = true 
    user_data = << EOF
                #!/bin/bash
sudo yum install httpd wget unzip epel-release mysql -y
sudo yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
sudo yum -y install yum-utils
sudo yum-config-manager --enable remi-php56   [Install PHP 5.6]
sudo yum -y install php php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo
sudo wget https://wordpress.org/latest.tar.gz
sudo tar -xf latest.tar.gz -C /var/www/html/
sudo mv /var/www/html/wordpress/* /var/www/html/
sudo cp /var/www/html/wp-config-sample.php  /var/www/html/wp-config.php 
sudo sed 's/database_name_here/mydb/g' /var/www/html/wp-config.php -i # put database name
sudo sed 's/username_here/team1/g' /var/www/html/wp-config.php -i         # put database username
sudo sed 's/password_here/team1project/g' /var/www/html/wp-config.php -i    # put database password
sudo sed 's/localhost/???/g' /var/www/html/wp-config.php -i               # put database endpoint
#DBNAME="db-wordpress"
sudo getenforce
sudo sed 's/SELINUX=permissive/SELINUX=enforcing/g' /etc/sysconfig/selinux -i
sudo setenforce 0
sudo chown -R apache:apache /var/www/html/
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


resource "aws_launch_configuration" "apache_template" {
    name          = "apache-template"
    image_id      = data.aws_ami.ubuntu.id
    instance_type = "t2.micro"
    key_name      = var.key_name
    security_groups = [ aws_security_group.allow_ssh_http.id ]
    iam_instance_profile = aws_iam_role.ec2_role.name  # Assign the IAM role to the launch configuration
    user_data = <<EOF
#!/bin/bash

# Update the system
sudo apt update -y

# Install required packages
sudo apt install -y software-properties-common

# Add Ansible repository
sudo apt-add-repository --yes --update ppa:ansible/ansible

# Install Ansible
sudo apt install -y ansible

aws s3 cp s3://application-bucket/amazon-cloudwatch-agent.json /tmp/amazon-cloudwatch-agent.json
aws s3 cp s3://application-bucket/playbook.yml /tmp/playbook.yml
ansible-playbook /tmp/playbook.yml

aws s3 cp s3://application-bucket/index.html /var/www/html

sudo service apache2 restart

sudo yum install awslogs -y
sudo systemctl start awslogsd

EOF

}
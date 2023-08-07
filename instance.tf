
# Define the instance details
resource "aws_instance" "instance1" {
  ami           = var.ami  # Change this to your desired AMI ID
  instance_type = "t2.micro"
  user_data = base64encode(file("script1.sh"))
  # user_data     = file("script1.sh")  # Attach script1.sh to this instance
  key_name      = "key_tf"  # Replace this with your actual SSH key pair name
  # Attach the security group to the instance
  vpc_security_group_ids = [aws_security_group.instance_security_group.id]
 # Set the instance name tag
  tags = {
    Name = "Instance1"
  }
}

# # Define the instance details
# resource "aws_instance" "instance1" {
#   ami           = var.ami  # Change this to your desired AMI ID
#   instance_type = "t2.micro"
#   key_name      = var.ssh_key_name  # Attach the same SSH key to instance1

#   # Attach the security group to the instance
#   vpc_security_group_ids = [aws_security_group.instance_security_group.id]

#   # Set the instance name tag
#   tags = {
#     Name = "Instance1"
#   }

#   # Use user data to set up Jenkins on the instance
#   user_data = <<-EOF
#               #!/bin/bash
#               echo "This is script 1 running on instance 1" > /tmp/output.txt
#               sudo apt update
#               sudo apt upgrade -y
#               sudo apt install openjdk-11-jdk -y
#               wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo gpg --dearmor -o /usr/share/keyrings/jenkins.gpg
#               sudo sh -c 'echo deb [signed-by=/usr/share/keyrings/jenkins.gpg] http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
#               sudo apt update
#               sudo apt install jenkins -y
#               sudo systemctl start jenkins
#               sudo systemctl enable jenkins
#               sudo systemctl status jenkins
#               EOF
# }
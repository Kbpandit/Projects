resource "aws_instance" "kbday1" {
  ami           = var.ami           # Change this to an appropriate AMI ID
  instance_type = var.instance_type # Change instance type as needed
  root_block_device {
    volume_size           = 20 # Size in GB
    volume_type           = "gp3"
    delete_on_termination = true
    encrypted             = true
  }
  tags = {
    Name = "MyEC2Instance"
  }
}

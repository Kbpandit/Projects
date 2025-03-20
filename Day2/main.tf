provider "aws" {
  alias  = "ap_south"
  region = "ap-south-1"
}

provider "aws" {
  alias  = "us_west"
  region = "us-west-2"
}

resource "aws_instance" "ec2_ap_south" {
  provider          = aws.ap_south
  availability_zone = "ap-south-1b"
  ami              = "ami-05c179eced2eb9b5b" # Replace with a valid AMI ID for ap-south-1
  instance_type     = "t2.micro"

  tags = {
    Name = "EC2-ap-south"
  }
}

resource "aws_instance" "ec2_us_west" {
  provider      = aws.us_west
  ami          = "ami-0b6d6dacf350ebc82" # Replace with a valid AMI ID for us-west-2
  instance_type = "t2.micro"

  tags = {
    Name = "EC2-US-West"
  }
}

resource "aws_ebs_volume" "extra_volume" {
  provider          = aws.ap_south
  availability_zone = "ap-south-1b"  # Ensure it matches the instance AZ
  size             = 20  # Size in GB
  type             = "gp3"  # EBS volume type

  tags = {
    Name = "extra-volume"
  }
}

resource "aws_volume_attachment" "extra_attachment" {
  device_name = "/dev/sdf"  # Use a valid device name
  volume_id   = aws_ebs_volume.extra_volume.id
  instance_id = aws_instance.ec2_ap_south.id  # Correct instance reference
  }

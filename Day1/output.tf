output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.kbday1.id
}

output "public_ip" {
  description = "The public IP of the EC2 instance"
  value       = aws_instance.kbday1.public_ip
}
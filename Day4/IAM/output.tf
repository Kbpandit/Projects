output "iam_user_names" {
  value = { for key, user in aws_iam_user.myuser : key => user.name }
}
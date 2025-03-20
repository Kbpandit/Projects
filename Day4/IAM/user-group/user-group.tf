resource "aws_iam_group" "database" {
  name = "database"
}

resource "aws_iam_user" "users" {
  for_each = toset(var.myuser)
  name     = each.key
}

resource "aws_iam_group_membership" "database_membership" {
  name  = "database-group-membership"
  group = aws_iam_group.database.name

  users = [
    for user in aws_iam_user.users : user.name
  ]
}

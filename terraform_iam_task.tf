variable "suffix" {
  description = "Suffix to be appended to resource names"
  default     = "-ci"  # You can change this to any desired suffix
}

resource "aws_iam_role" "iam_role" {
  name               = "prod${var.suffix}-role"
  assume_role_policy = jsonencode({
    Version   = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = { "AWS" : "*" },
        Action    = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy" "iam_policy" {
  name   = "prod${var.suffix}-policy"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Action    = "sts:AssumeRole",
        Resource  = aws_iam_role.iam_role.arn
      }
    ]
  })
}

resource "aws_iam_group" "iam_group" {
  name = "prod${var.suffix}-group"
}

resource "aws_iam_group_policy_attachment" "iam_group_attachment" {
  group      = aws_iam_group.iam_group.name
  policy_arn = aws_iam_policy.iam_policy.arn
}

resource "aws_iam_user" "iam_user" {
  name = "prod${var.suffix}-user"
  groups = [aws_iam_group.iam_group.name]
}

resource "aws_ecr_repository" "repo" {
  name                 = "${var.environment}-${var.project}-ecr"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_lifecycle_policy" "cleanup" {
  repository = aws_ecr_repository.repo.name
  policy     = <<EOF
{
    "rules": [
       {
            "rulePriority": 1,
            "description": "Keep last 3 images for production",
            "selection": {
                "tagStatus": "tagged",
                "tagPrefixList": ["prod"],
                "countType": "imageCountMoreThan",
                "countNumber": 3
            },
            "action": {
                "type": "expire"
            }
        },
        {
            "rulePriority": 2,
            "description": "Keep last 3 images based on master branch",
            "selection": {
                "tagStatus": "tagged",
                "tagPrefixList": ["master"],
                "countType": "imageCountMoreThan",
                "countNumber": 3
            },
            "action": {
                "type": "expire"
            }
        },
        {
            "rulePriority": 3,
            "description": "Keep last 2 images for acc",
            "selection": {
                "tagStatus": "tagged",
                "tagPrefixList": ["acc-latest", "acceptance-latest"],
                "countType": "imageCountMoreThan",
                "countNumber": 2
            },
            "action": {
                "type": "expire"
            }
        },
        {
            "rulePriority": 4,
            "description": "Keep 14 days of images for acc",
            "selection": {
                "tagStatus": "tagged",
                "tagPrefixList": ["acc"],
                "countType": "sinceImagePushed",
                "countUnit": "days",
                "countNumber": 14
            },
            "action": {
                "type": "expire"
            }
        },
        {
            "rulePriority": 5,
            "description": "Keep last image for test",
            "selection": {
                "tagStatus": "tagged",
                "tagPrefixList": ["test"],
                "countType": "imageCountMoreThan",
                "countNumber": 1
            },
            "action": {
                "type": "expire"
            }
        },
        {
            "rulePriority": 6,
            "description": "Keep last image for dev",
            "selection": {
                "tagStatus": "tagged",
                "tagPrefixList": ["dev"],
                "countType": "imageCountMoreThan",
                "countNumber": 1
            },
            "action": {
                "type": "expire"
            }
        },
        {
            "rulePriority": 7,
            "description": "Keep last image tagged latest (needed in some specific cases)",
            "selection": {
                "tagStatus": "tagged",
                "tagPrefixList": ["latest"],
                "countType": "imageCountMoreThan",
                "countNumber": 1
            },
            "action": {
                "type": "expire"
            }
        },
        {
            "rulePriority": 8,
            "description": "Expire untagged images older than 1 days",
            "selection": {
                "tagStatus": "untagged",
                "countType": "sinceImagePushed",
                "countUnit": "days",
                "countNumber": 1
            },
            "action": {
                "type": "expire"
            }
        },
        {
            "rulePriority": 9,
            "description": "Expire any other tagged images except the newest",
            "selection": {
                "tagStatus": "any",
                "countType": "imageCountMoreThan",
                "countNumber": 1
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF
}


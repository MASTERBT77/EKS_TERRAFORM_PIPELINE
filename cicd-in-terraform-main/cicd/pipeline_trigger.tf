resource "aws_cloudwatch_event_rule" "demo_repo_activity" {
  name        = "demo-repo-activity"
  description = "Detect commits to repo"

  event_pattern = <<PATTERN
  {
    "source": [ "aws.codecommit" ],
    "detail-type": [ "CodeCommit Repository State Change" ],
    "resources": [ "arn:aws:codecommit:${local.region}:${local.account_id}:${aws_codecommit_repository.demo_codecommit_repo.repository_name}" ],
    "detail": {
      "event": [
        "referenceCreated",
        "referenceUpdated"
        ],
      "referenceType":["branch"],
      "referenceName": ["${var.codecommit_repo_branch_name}"]
    }
  }
  PATTERN


  /*
  event_pattern = <<PATTERN
{
  "source": [
    "aws.ecr"
  ],
  "detail": {
    "action-type": [
      "PUSH"
    ],
    "image-tag": [
      "latest"
    ],
    "repository-name": [
      "${aws_ecr_repository.demo_ecr_repo.name}"
    ],
    "result": [
      "SUCCESS"
    ]
  },
  "detail-type": [
    "ECR Image Action"
  ]
}
PATTERN
*/
}

resource "aws_cloudwatch_event_target" "demo_repo_trigger" {
  target_id = "demo_repo_trigger"
  rule      = aws_cloudwatch_event_rule.demo_repo_activity.name
  #arn       = "arn:aws:codepipeline:${local.region}:${local.account_id}:demo-codepipeline"
  arn      = aws_codepipeline.demo_codepipeline.arn
  role_arn = aws_iam_role.cloudwatch_ci_role.arn
}



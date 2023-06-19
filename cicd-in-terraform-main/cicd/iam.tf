#################### CODE COMMIT USER - STARTS #############################
/*
resource "aws_iam_user" "code_commit_user" {
  name = "codeCommitUser"

}
resource "aws_iam_user_policy_attachment" "code_commit_user_policy_attach" {
  user       = aws_iam_user.code_commit_user.name
  policy_arn = var.AWSCodeCommitPowerUser
}
*/
#################### CODE COMMIT USER - ENDS #############################

#################### CODE_BUILD ROLE - STARTS #############################
resource "aws_iam_role" "codebuild_role" {
  name = "CodeBuildRole"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
        "Effect": "Allow",
        "Principal": {
            "Service": "codebuild.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
        }
    ]
}
EOF
  managed_policy_arns = [var.AWSCodeCommitFullAccess, var.AmazonEC2ContainerRegistryFullAccess,
  var.AmazonS3FullAccess, var.CloudWatchLogsFullAccess, var.AWSCodeBuildAdminAccess]
}

resource "aws_iam_role_policy" "code_build_role_policy" {
  role = aws_iam_role.codebuild_role.name
  name = "CodeBuildRoleInlinePolicy"

  policy = templatefile("${path.module}/policies/code_build_role_policy.tpl",
  { region = local.region, account_id = local.account_id })
}
#################### CODE_BUILD ROLE - ENDS #############################

#################### CODE_PIPELINE ROLE - STARTS ########################
resource "aws_iam_role" "codepipeline_role" {
  name = "CodePipelineRole"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "codepipeline.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "codepipeline_policy" {
  name = "CodePipelineInlinePolicy"
  role = aws_iam_role.codepipeline_role.id

  policy = templatefile("${path.module}/policies/pipeline_role_policy.tpl", {})
}
#################### CODE_PIPELINE ROLE - ENDS ########################



############ CLOUD_WATCH TRIGGER ROLE - STARTS ########################

# Allows the CloudWatch event to assume roles
resource "aws_iam_role" "cloudwatch_ci_role" {
  name = "CICloudWatchRole"

  assume_role_policy = <<DOC
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "events.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
DOC
}
data "aws_iam_policy_document" "cloudwatch_ci_role_policy" {

  statement {
    # Allow CloudWatch to start the Pipeline
    actions = [
      "codepipeline:StartPipelineExecution"
    ]
    resources = [
      #"arn:aws:codepipeline:${local.region}:${local.account_id}:demo-codepipeline",
      aws_codepipeline.demo_codepipeline.arn
    ]
  }
}
resource "aws_iam_role_policy" "cloudwatch_ci_role_policy" {
  name   = "CloudWatchCIRoleInlinePolicy"
  role   = aws_iam_role.cloudwatch_ci_role.name
  policy = data.aws_iam_policy_document.cloudwatch_ci_role_policy.json
}

############ CLOUD_WATCH TRIGGER ROLE - ENDS ########################
variable "AWSCodeCommitFullAccess" {
  description = "AWSCodeCommitFullAccess policy arn"
  type        = string
  default     = "arn:aws:iam::aws:policy/AWSCodeCommitFullAccess"
}
variable "AmazonEC2ContainerRegistryFullAccess" {
  description = "AmazonEC2ContainerRegistryFullAccess policy arn"
  type        = string
  default     = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
}
variable "AmazonS3FullAccess" {
  description = "AmazonS3FullAccess policy arn"
  type        = string
  default     = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}
variable "CloudWatchLogsFullAccess" {
  description = "CloudWatchLogsFullAccess policy arn"
  type        = string
  default     = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
}
variable "AWSCodeBuildAdminAccess" {
  description = "AWSCodeBuildAdminAccess policy arn"
  type        = string
  default     = "arn:aws:iam::aws:policy/AWSCodeBuildAdminAccess"
}
variable "AWSCodeCommitPowerUser" {
  description = "AWSCodeCommitPowerUser policy arn"
  type        = string
  default     = "arn:aws:iam::aws:policy/AWSCodeCommitPowerUser"
}

variable "source_type" {
  description = "code source type"
  type        = string
  default     = "CODEPIPELINE"
}
variable "codecommit_repo_name" {
  description = "demo codecommit repo name"
  type        = string
  default     = "demo-codecommit-repo"
}
variable "codecommit_repo_branch_name" {
  description = "demo codecommit repo branch name"
  type        = string
  default     = "main"
}
variable "ecr_repo_name" {
  description = "demo ecr repo name"
  type        = string
  default     = "demo-ecr-repo"
}
variable "codebuild_project_name" {
  description = "demo codebuild Project name"
  type        = string
  default     = "demo-codebuild-project"
}

variable "codebuild_deploy_project_name" {
  description = "demo codebuild KUBECTL deploy Project name"
  type        = string
  default     = "demo-codebuild-deploy-project"
}
variable "codebuild_test_project_name" {
  description = "demo codebuild Test Project name"
  type        = string
  default     = "demo-codebuild-test-project"
}
variable "codebuild_lint_project_name" {
  description = "demo codebuild Lint Project name"
  type        = string
  default     = "demo-codebuild-lint-project"
}

variable "codepipeline_name" {
  description = "codepipeline name"
  type        = string
  default     = "demo-codepipeline"
}

variable "buildspec" {
  description = "buildspec"
  type        = string
  default     = "buildspec.yml"
}

variable "deployspec" {
  description = "deployspec"
  type        = string
  default     = "deployspec.yml"
}

variable "testspec" {
  description = "testspec"
  type        = string
  default     = "testspec.yml"
}
variable "lintspec" {
  description = "lintspec"
  type        = string
  default     = "lintspec.yml"
}

variable "eks_cluster_name" {
  description = "Cluster Name"
  type        = string
  default     = "demo-cluster"
}


locals {
  account_id = data.aws_caller_identity.current.account_id
  region     = data.aws_region.current.name
}
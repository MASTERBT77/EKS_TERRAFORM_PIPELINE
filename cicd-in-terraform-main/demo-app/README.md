## Overview

This Sub-Repo contains a sampe python API code to help test the provisioned CI/CD pipeline.


## Prerequisites 

- Follow prerequisites from parent <a></a>[README](../README.md#prerequisites)

- Build CICD infrastructure following <a></a>[cicd/README](../cicd/README.md)


## Sub Repository Structure

- **spec.yml* files are for respective stages in the pipeline

- Python api and test code in /app directory

- Deploy manifests in /deploy/manifests directory


## Deployment Steps

Once the CICD infrastructure is deployed and prerequisite steps followed:

- Create "main" branch for newly provisioned AWS CodeCommit Repo "demo-codecommit-repo" - <a></a>[Instructions](https://docs.aws.amazon.com/codecommit/latest/userguide/how-to-create-branch.html)

- Add newly created "CodeBuildRole" to aws-config  configMap of your existing EKS Cluster - <a></a>[Instructions](https://docs.aws.amazon.com/eks/latest/userguide/add-user-role.html)

- Push the sample app to main branch CodeCommit Repo and that should trigger CICD pipeline.


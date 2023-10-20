resource "github_repository_collaborator" "example" {
  repository = "Practical-DevOps-GitHub/github-terraform-task-0leron"
  username   = "softservedata"
  permission = "push"
}
resource "github_branch" "default" {
  repository = "Practical-DevOps-GitHub/github-terraform-task-0leron"
  branch     = "develop"
}
resource "github_branch_protection" "main" {
  repository = "Practical-DevOps-GitHub/github-terraform-task-0leron"
  branch     = "main"

  enforce_admins             = true
  require_signed_commits     = true
  require_approving_review_count = 1
}

resource "github_branch_protection" "develop" {
  repository = "Practical-DevOps-GitHub/github-terraform-task-0leron"
  branch     = "develop"

  require_pull_request_reviews {
    required_approving_review_count = 2
  }
}
resource "github_code_owner" "example" {
  repository = "Practical-DevOps-GitHub/github-terraform-task-0leron"
  pattern    = "*"
  owner      = "softservedata"
}
resource "github_file" "pull_request_template" {
  repository = "Practical-DevOps-GitHub/github-terraform-task-0leron"
  file_path  = ".github/pull_request_template.md"
  content    = <<EOF
Describe your changes

Issue ticket number and link

Checklist before requesting a review
- [ ] I have performed a self-review of my code
- [ ] If it is a core feature, I have added thorough tests
- [ ] Do we need to implement analytics?
- [ ] Will this be part of a product update? If yes, please write one phrase about this update
EOF
}
resource "github_repository_deploy_key" "example" {
  repository     = "Practical-DevOps-GitHub/github-terraform-task-0leron"
  title          = "DEPLOY_KEY"
  key            = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDmHmLcoYjbILTfTmG9RdpYnEuwTPpPdGM1Ku9bgkQtLmJWz5qDYrNTLwc4tRJxmbVXRVXDcpttaoDVlV72+ljZT/9JGii/R5geRAkk003WZqwpkdu6FlNefqvZFx3qtqBGf3rNUbZFVammVAFJT0l3mfe59zos9ticHabvmeTV6lKxf4t1HgLcgXw659w3ZbfCrYaOCTF2VrbZt/od14MtcXG+0v5xqw/DcitpNaTX8znpwNquLFj6X10tvEvzXBVYiZWYhw4Du+ar2V2FPy4ODENXSLDFkNlsWQEXTX7lMAv7+4HHiRNsP6NXEK2VSP+I9+laj2jzWcvbup5ajn53E01NounFxGH04fHWwd55WPwfVaJepBZLJcX4FWGiz6qFBKkCfOHIj4lmyTAppETE3VzcsQY+wG4xk9BHlyMIBs8BuaRT9NW7UcWwy4b+RjCEcJHZ6J9EQm/rltdu5W3PAJM/rS/WgS9tuyD3FXAlqBapRmMQhgzKtJoPZgnglpc="
  read_only      = true
}

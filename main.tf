##main.tf

data "tfe_workspace_ids" "aws" {
  tag_names    = ["aws"]
  organization = var.organization
}

data "tfe_workspace_ids" "gcp" {
  tag_names    = ["gcp"]
  organization = var.organization
}

data "tfe_workspace_ids" "azure" {
  tag_names    = ["azure"]
  organization = var.organization
}



resource "tfe_policy_set" "aws-s3-best-practices" {
  global        = false
  name          = "aws-s3-security-best-practice-sentinel"
  organization  = var.organization
  workspace_ids = data.tfe_workspace_ids.aws.ids
  vcs_repo {
    identifier         = "ausmartway/aws-s3-security-best-practice-sentinel"
    ingress_submodules = false
    oauth_token_id     = var.tfc_oauth_token_id
  }
}

resource "tfe_policy_set" "azure-fundational-sentinel-policies" {
  global        = false
  name          = "azure-fundational-sentinel-policies"
  organization  = var.organization
  workspace_ids = data.tfe_workspace_ids.aws.ids
  vcs_repo {
    identifier         = "ausmartway/azure-fundational-sentinel-policies"
    ingress_submodules = false
    oauth_token_id     = var.tfc_oauth_token_id
  }
}

resource "tfe_policy_set" "cis-gcp-fundational-policies" {
  global        = false
  name          = "cis-gcp-fundational-policies"
  organization  = var.organization
  workspace_ids = data.tfe_workspace_ids.aws.ids
  vcs_repo {
    identifier         = "ausmartway/ausmartway/cis-gcp-fundational-policies"
    ingress_submodules = false
    oauth_token_id     = var.tfc_oauth_token_id
  }
}



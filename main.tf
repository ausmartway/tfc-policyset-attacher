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
  name          = "aws-s3-security-best-practice-sentinel"
  organization  = var.organization
  workspace_ids = values(data.tfe_workspace_ids.aws.ids)
  vcs_repo {
    identifier         = "ausmartway/aws-s3-security-best-practice-sentinel"
    ingress_submodules = false
    oauth_token_id     = var.tfc_oauth_token_id
  }
}

resource "tfe_policy_set" "azure-fundational-sentinel-policies" {
  name          = "azure-fundational-sentinel-policies"
  organization  = var.organization
  workspace_ids = values(data.tfe_workspace_ids.azure.ids)
  vcs_repo {
    identifier         = "ausmartway/azure-fundational-sentinel-policies"
    ingress_submodules = false
    oauth_token_id     = var.tfc_oauth_token_id
  }
}

resource "tfe_policy_set" "cis-gcp-fundational-policies" {
  name          = "cis-gcp-fundational-policies"
  organization  = var.organization
  workspace_ids = values(data.tfe_workspace_ids.gcp.ids)
  vcs_repo {
    identifier         = "ausmartway/cis-gcp-fundational-policies"
    ingress_submodules = false
    oauth_token_id     = var.tfc_oauth_token_id
  }
}



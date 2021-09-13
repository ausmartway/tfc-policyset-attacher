##main.tf

data "tfe_workspace_ids" "aws" {
  tag_names    = ["aws"]
  organization = var.organization
}
resource "tfe_policy_set" "aws-s3-bestpractices" {
    global        = false
    name          = "aws-s3-security-best-practice-sentinel"
    organization  = var.organization
    vcs_repo {
        identifier         = "ausmartway/aws-s3-security-best-practice-sentinel"
        ingress_submodules = false
        oauth_token_id     = var.tfc_oauth_token_id
    }
}

# resource "tfe_policy_set" "azure-fundational-sentinel-policies" {
#     global        = false
#     name          = "azure-fundational-sentinel-policies"
#     organization  = "yulei"
#     vcs_repo {
#         identifier         = "ausmartway/azure-fundational-sentinel-policies"
#         ingress_submodules = false
#         oauth_token_id     = local.tfc_oauth_token
#     }
# }

# resource "tfe_policy_set" "cis-gcp-fundational-policies" {
#     global        = false
#     name          = "cis-gcp-fundational-policies"
#     organization  = "yulei"
#     vcs_repo {
#         identifier         = "ausmartway/ausmartway/cis-gcp-fundational-policies"
#         ingress_submodules = false
#         oauth_token_id     = local.tfc_oauth_token
#     }
# }


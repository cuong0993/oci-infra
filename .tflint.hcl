plugin "terraform" {
  source  = "github.com/terraform-linters/tflint-ruleset-terraform"
  version = "0.2.1"
  enabled = true
  preset  = "all"
}

rule "terraform_documented_variables" {
  enabled = false
}

rule "terraform_documented_outputs" {
  enabled = false
}

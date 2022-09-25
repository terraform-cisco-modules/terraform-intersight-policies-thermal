<!-- BEGIN_TF_DOCS -->
# Terraform Intersight Policies - Thermal
Manages Intersight Thermal Policies

Location in GUI:
`Policies` » `Create Policy` » `Thermal`

## Example

### main.tf
```hcl
module "thermal" {
  source  = "terraform-cisco-modules/policies-thermal/intersight"
  version = ">= 1.0.1"

  description      = "default Thermal Policy."
  fan_control_mode = "Balanced"
  name             = "default"
  organization     = "default"
}
```

### provider.tf
```hcl
terraform {
  required_providers {
    intersight = {
      source  = "CiscoDevNet/intersight"
      version = ">=1.0.32"
    }
  }
  required_version = ">=1.3.0"
}

provider "intersight" {
  apikey    = var.apikey
  endpoint  = var.endpoint
  secretkey = var.secretkey
}
```

### variables.tf
```hcl
variable "apikey" {
  description = "Intersight API Key."
  sensitive   = true
  type        = string
}

variable "endpoint" {
  default     = "https://intersight.com"
  description = "Intersight URL."
  type        = string
}

variable "secretkey" {
  description = "Intersight Secret Key."
  sensitive   = true
  type        = string
}
```

## Environment Variables

### Terraform Cloud/Enterprise - Workspace Variables
- Add variable apikey with value of [your-api-key]
- Add variable secretkey with value of [your-secret-file-content]

### Linux
```bash
export TF_VAR_apikey="<your-api-key>"
export TF_VAR_secretkey=`cat <secret-key-file-location>`
```

### Windows
```bash
$env:TF_VAR_apikey="<your-api-key>"
$env:TF_VAR_secretkey="<secret-key-file-location>""
```


## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.3.0 |
| <a name="requirement_intersight"></a> [intersight](#requirement\_intersight) | >=1.0.32 |
## Providers

| Name | Version |
|------|---------|
| <a name="provider_intersight"></a> [intersight](#provider\_intersight) | 1.0.32 |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apikey"></a> [apikey](#input\_apikey) | Intersight API Key. | `string` | n/a | yes |
| <a name="input_endpoint"></a> [endpoint](#input\_endpoint) | Intersight URL. | `string` | `"https://intersight.com"` | no |
| <a name="input_secretkey"></a> [secretkey](#input\_secretkey) | Intersight Secret Key. | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | Description for the Policy. | `string` | `""` | no |
| <a name="input_fan_control_mode"></a> [fan\_control\_mode](#input\_fan\_control\_mode) | Sets the Fan Control Mode of the System. High Power, Maximum Power and Acoustic modes are only supported for Cisco UCS X series Chassis.<br>  * Acoustic - The fan speed is reduced to reduce noise levels in acoustic-sensitive environments. This Mode is only supported for UCS X series Chassis.<br>  * Balanced - The fans run faster when needed based on the heat generated by the server. When possible, the fans returns to the minimum required speed.<br>  * LowPower - The Fans run at the minimum speed required to keep the server cool.<br>  * HighPower - The fans are kept at higher speed to emphasizes performance over power consumption. This Mode is only supported for UCS X series Chassis.<br>  * MaximumPower - The fans are always kept at maximum speed. This option provides the most cooling and consumes the most power. This Mode is only supported for UCS X series Chassis. | `string` | `"Balanced"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name for the Policy. | `string` | `"default"` | no |
| <a name="input_organization"></a> [organization](#input\_organization) | Intersight Organization Name to Apply Policy to.  https://intersight.com/an/settings/organizations/. | `string` | `"default"` | no |
| <a name="input_profiles"></a> [profiles](#input\_profiles) | list of Chassis Profiles to Assign to the Policy. | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | List of Tag Attributes to Assign to the Policy. | `list(map(string))` | `[]` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_moid"></a> [moid](#output\_moid) | Thermal Policy Managed Object ID (moid). |
## Resources

| Name | Type |
|------|------|
| [intersight_thermal_policy.thermal](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/thermal_policy) | resource |
| [intersight_chassis_profile.profiles](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/chassis_profile) | data source |
| [intersight_organization_organization.org_moid](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/organization_organization) | data source |
<!-- END_TF_DOCS -->
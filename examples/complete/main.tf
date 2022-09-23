module "thermal_policy" {
  source  = "terraform-cisco-modules/policies-thermal/intersight"
  version = ">= 1.0.1"

  description  = "default Thermal Policy."
  name         = "default"
  organization = "default"
}

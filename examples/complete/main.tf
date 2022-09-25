module "thermal" {
  source  = "terraform-cisco-modules/policies-thermal/intersight"
  version = ">= 1.0.1"

  description      = "default Thermal Policy."
  fan_control_mode = "Balanced"
  name             = "default"
  organization     = "default"
}

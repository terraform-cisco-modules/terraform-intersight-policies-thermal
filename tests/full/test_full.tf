module "main" {
  source           = "../.."
  description      = "${var.name} Thermal Policy."
  fan_control_mode = "Balanced"
  name             = var.name
  organization     = "terratest"
}

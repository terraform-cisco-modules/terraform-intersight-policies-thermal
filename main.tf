#____________________________________________________________
#
# Intersight Organization Data Source
# GUI Location: Settings > Settings > Organizations > {Name}
#____________________________________________________________

data "intersight_organization_organization" "org_moid" {
  name = var.organization
}

#____________________________________________________________
#
# Intersight UCS Chassis Profile(s) Data Source
# GUI Location: Profiles > UCS Chassis Profiles > {Name}
#____________________________________________________________

data "intersight_chassis_profile" "profiles" {
  for_each = { for v in var.profiles : v => v if length(var.profiles) > 0 }
  name     = each.value
}

#__________________________________________________________________
#
# Intersight Thermal Policy
# GUI Location: Policies > Create Policy > Thermal
#__________________________________________________________________

resource "intersight_thermal_policy" "thermal" {
  depends_on = [
    data.intersight_chassis_profile.profiles
  ]
  description      = var.description != "" ? var.description : "${var.name} Thermal Policy."
  fan_control_mode = var.fan_control_mode
  name             = var.name
  organization {
    moid        = data.intersight_organization_organization.org_moid.results[0].moid
    object_type = "organization.Organization"
  }
  dynamic "profiles" {
    for_each = toset(var.profiles)
    content {
      moid        = data.intersight_chassis_profile.profiles[profiles.value].results[0].moid
      object_type = "chassis.Profile"
    }
  }
  dynamic "tags" {
    for_each = var.tags
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }
}

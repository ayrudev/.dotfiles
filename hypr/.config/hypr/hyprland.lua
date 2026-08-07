require("modules/animations")
require("modules/binds")
require("modules/dwindle")
require("modules/env")
require("modules/exec")
require("modules/gestures")
require("modules/monitors")
require("modules/windowRules")
require("modules/workspaceRules")

hl.config({
  general = {
    border_size = 2,
    gaps_in = 4,
    gaps_out = 16,
    col = {
      active_border = "rgba(FFFFFFFF)",
      inactive_border = "rgba(595959aa)",
    },

    resize_on_border = false,
    allow_tearing = false,
  },

  decoration = {
    rounding = 3,
    rounding_power = 2,
    dim_special = 0.5,
    blur = {
      enabled = true,
      size = 4,
      passes = 2,
      noise = 0,
      contrast = 1,
      brightness = 1,
      vibrancy = 1,
    },
    shadow = {
      enabled = false,
    },
  },

  input = {
    kb_layout = "us, us",
    kb_variant = " , intl,",
    kb_options = "grp:alt_shift_toggle",
    accel_profile = "flat",
    touchpad = {
      natural_scroll = true,
    },
  },

  xwayland = {
    force_zero_scaling = true,
  },

  misc = {
    disable_hyprland_logo = true,
    disable_splash_rendering = true,
    mouse_move_enables_dpms = false,
    key_press_enables_dpms = false,
  },

  ecosystem = {
    no_update_news = true,
    no_donation_nag = true,
    enforce_permissions = false,
  },
})

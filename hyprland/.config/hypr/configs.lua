hl.config({
  cursor = {
    persistent_warps = true,
  },

  decoration = {
    rounding = 4,
    active_opacity = 1.0,
    inactive_opacity = 0.98,

    shadow = {
      enabled = true,
      range = 4,
      render_power = 3,
      color = "rgba(1a1a1aee)",
    },

    blur = {
      enabled = true,
      size = 3,
      passes = 1,
      vibrancy = 0.1696,
    },
  },

  dwindle = {
    preserve_split = true,
  },

  general = {
    -- Gaps
    gaps_in = 4,
    gaps_out = 8,

    -- Borders
    border_size = 1,
    col = {
      active_border = {
        colors = { "rgba(D3C6AADE)", "rgba(E69875A3)" },
        angle = 45,
      },
      inactive_border = "rgba(595959aa)",
    },

    -- Other
    resize_on_border = false,
    allow_tearing = false,
    layout = "dwindle",
  },

  input = {
    kb_layout = "us, ru",
    kb_variant = "",
    kb_model = "",
    kb_options = "ctrl:nocaps, grp:win_space_toggle",
    kb_rules = "",

    follow_mouse = 1,
    mouse_refocus = false,

    sensitivity = 0, -- (-1.0, - 1.0) - 0 means no modification.

    natural_scroll = true,

    touchpad = {
      natural_scroll = true,
    },
  },

  misc = {
    disable_hyprland_logo = true,
    middle_click_paste = false,
    allow_session_lock_restore = true,
  },
})

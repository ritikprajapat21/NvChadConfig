return {
  view = {
    width = 35,
    relativenumber = true,
  },
  update_focused_file = {
    enable = true,
    update_root = true,
  },
  git = {
    ignore = false,
  },
  renderer = {
    indent_markers = {
      enable = true,
    },
    icons = {
      glyphs = {
        folder = {
          arrow_closed = "", -- arrow when folder is closed
          arrow_open = "", -- arrow when folder is open
        },
      },
    },
  },
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },
}

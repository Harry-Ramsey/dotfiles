return {
  "saghen/blink.cmp",
  version = '*',
  event = { "BufReadPost" },
  opts = {
    keymap = {
      preset = "enter",
    },
    completion = {
      keyword = {
        range = "full",
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 500,
        update_delay_ms = 50,
      },
      ghost_text = {
        enabled = true,
      },
    },
    sources = {
      default = {
        "lsp",
        "path",
        "buffer"
      },
    },
    fuzzy = {
        implementation = "prefer_rust_with_warning"
    },
  }
}

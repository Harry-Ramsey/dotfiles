return {
  'saghen/blink.cmp',
  version = '0.14.0',
  event = { "BufReadPost" },
  opts = {
    keymap = {
      preset = "enter",
    },

    sources = {
      default = { "lsp", "path", "buffer" },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" }
  }
}

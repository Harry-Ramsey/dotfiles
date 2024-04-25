return {
  "folke/trouble.nvim",
  opts = {},
  cmd = "Trouble",
  keys = {
    {
      "<leader>tt",
      function() require("trouble").toggle({ mode = "document_diagnostics" }) end,
      desc = "Buffer Diagnostics (Trouble)"
    }
  },
}


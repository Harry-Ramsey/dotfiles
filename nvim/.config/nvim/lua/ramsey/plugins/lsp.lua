return {
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "mason-org/mason-lspconfig.nvim",
    event = { "BufReadPost" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
            "lua_ls",
            "pyright",
            "clangd",
            "rust_analyzer",
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },
    event = { "BufReadPost" },
    keys = {
      { "<leader>fd", "<cmd> lua vim.lsp.buf.definition()<CR>", desc = "View function definition"},
    },
    config = function()
      local cmpengine = require("blink.cmp")
      local capabilities = cmpengine.get_lsp_capabilities()
    end
  }
}

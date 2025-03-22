return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
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
      require("mason-lspconfig").setup_handlers {
        -- Default setup for LSP autocomplete
        function (server_name)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities
          })
        end
      }
    end
  }
}

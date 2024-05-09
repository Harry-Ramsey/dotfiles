return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = {"BufReadPost" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost" },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Setup LSP Autocomplete
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })


      -- Setup Keybinds
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
        vim.keymap.set("n", "F", vim.lsp.buf.hover, { desc = "Show function documentation" })
        end
      })
    end
  }
}


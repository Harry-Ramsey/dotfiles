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
    dependencies = { "hrsh7th/nvim-cmp" },
    event = { "BufReadPost" },
    keys = {
      { "<leader>fd", "<cmd> lua vim.lsp.buf.definition()<CR>", desc = "View function definition"},
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      require("mason-lspconfig").setup_handlers {
        -- Default setup for LSP autocomplete
        function (server_name)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities;
          })
        end,
      }

      -- Setup Keybinds 
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function()
        end
      })
    end
  }
}


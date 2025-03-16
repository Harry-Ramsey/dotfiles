return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "williamboman/mason.nvim",
      "jay-babu/mason-nvim-dap.nvim",
    },
    keys = {
      { "<F5>", "<cmd>DapContinue<CR>", desc = "Start debug session" },
      { "<F9>", "<cmd>DapToggleBreakpoint<CR>", desc = "Toggle breakpoint" },
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      -- Ensure debugpy is installed
      require("mason-nvim-dap").setup({ ensure_installed = { "python" } })

      -- Configure DAP for Python
      dap.adapters.python = {
        type = "executable",
        command = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python3",
        args = { "-m", "debugpy.adapter" },
      }

      dap.configurations.python = {
        {
          type = "python",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          pythonPath = function()
            return os.getenv("VIRTUAL_ENV") and os.getenv("VIRTUAL_ENV") .. "/bin/python3" or "python3"
          end,
        },
      }

      -- Setup DAP UI
      dapui.setup()

      -- Auto open/close DAP UI
      dap.listeners.after.event_initialized["dapui_config"] = function()
          require("nvim-tree.api").tree.close()
          dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
      dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
    end,
  },
}

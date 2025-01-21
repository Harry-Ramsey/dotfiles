return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = { "BufReadPost" },
  config = function ()
    require("bufferline").setup{
      options = {
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function (count, level, diagnostics_dict, context)
          local icon

          if level == "error" then
            icon = " " .. count
          elseif level == "warning" then
            icon = " " .. count
          else
            icon = ""
          end

          return icon
        end
      }
    }
  end
}

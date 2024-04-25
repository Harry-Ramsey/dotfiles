return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
	keys = {
		{ "<leader>ee", "<cmd>NvimTreeFocus<CR>", desc = "Toggle file explorer" },
	},
	dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {}
  end,
}

return {
  'nvim-telescope/telescope.nvim', tag = '0.1.6',
  dependencies = { 'nvim-lua/plenary.nvim' },
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files in current working director" },
		{ "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Find using grep" },
		{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Find within buffer" },
		{ "<leader>fc", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Find within file"},
	},
}

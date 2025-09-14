return {
  "nvim-treesitter/nvim-treesitter",
  config = function ()
    require("nvim-treesitter").setup({
      auto_install = true,
      highlight = { enable = true },
    })
  end
}

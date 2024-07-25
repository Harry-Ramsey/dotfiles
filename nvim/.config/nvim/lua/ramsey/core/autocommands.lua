vim.api.nvim_create_autocmd("CursorHoldI", {
  callback = function()
    vim.lsp.buf.hover()
  end,
})

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.lsp.buf.hover()
  end,
})

vim.o.updatetime = 500

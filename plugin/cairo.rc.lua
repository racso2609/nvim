local autocmd = vim.api.nvim_create_autocmd
vim.g.cairo_linter_autosave = 1

autocmd("FileType", {
  pattern = "cairo",
  callback = function()
    print("cairo")
    require("cmp").setup.buffer { enabled = false }
  end,
})

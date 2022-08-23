local autocmd = vim.api.nvim_create_autocmd
local g = vim.g

vim.g.cairo_linter_autosave = 1
g.coc_start_at_startup = false

autocmd("FileType", {
  pattern = "cairo",
  callback = function()
    print("cairo")
    require("cmp").setup.buffer { enabled = false }
    -- g.
  end,
})

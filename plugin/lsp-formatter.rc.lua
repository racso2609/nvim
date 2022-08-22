local status, lsp_format = pcall(require, "lsp-format")
if (not status) then return end
local status2, lspconfig = pcall(require, "lspconfig")

if not status or not status2 then
  return
end

local prettier = {
  formatCommand = [[prettier --stdin-filepath ${INPUT} ]],
  formatStdin = true,
}

lsp_format.setup({})
lspconfig.efm.setup({
  on_attach = require("lsp-format").on_attach,
  init_options = { documentFormatting = true },
  settings = {
    languages = {
      typescript = { prettier },
      typescriptreact = { prettier },
      json = { prettier },
      yaml = { prettier },
      -- lua = { lua }
    },
  },
})

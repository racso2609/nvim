-- cspell: disable
local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
local completion = null_ls.builtins.completion

null_ls.setup({
  debug = true,
  sources = {
    -- lua
    formatting.stylua,
    -- tsserver
    formatting.prettier,
    code_actions.eslint,
    -- general
    diagnostics.shellcheck,
    diagnostics.write_good,
    diagnostics.cspell,
    code_actions.cspell,
    completion.spell,
  },
  timeout = 5000,
})

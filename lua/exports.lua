local exports = {}
exports.capabilities = vim.lsp.protocol.make_client_capabilities()
exports.capabilities = require('cmp_nvim_lsp').update_capabilities(exports.capabilities)

-- Functional wrapper for mapping custom keybindings
function exports.keymap(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

return exports

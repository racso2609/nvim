local exports = {}
-- Functional wrapper for mapping custom keybindings
function exports.keymap(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

exports.capabilities = vim.lsp.protocol.make_client_capabilities()

local status, cmp = pcall(require, 'cmp_nvim_lsp')
if (status) then
  exports.capabilities = cmp.update_capabilities(exports.capabilities)
end

return exports

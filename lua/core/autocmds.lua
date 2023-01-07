-- local is_available = racsonvim.is_available
local cmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local namespace = vim.api.nvim_create_namespace
-- local create_command = vim.api.nvim_create_user_command

cmd("TextYankPost", {
  desc = "Highlight yanked text",
  group = augroup("highlightyank", {
    clear = true,
  }),
  pattern = "*",
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- lazy loading git pluginscmd
-- cmd("BufRead", {
--   group = vim.api.nvim_create_augroup("git_plugin_lazy_load", { clear = true }),
--   callback = function()
--     vim.fn.system("git -C " .. vim.fn.expand "%:p:h" .. " rev-parse")
--     if vim.v.shell_error == 0 then
--       vim.api.nvim_del_augroup_by_name "git_plugin_lazy_load"
--       local packer = require "packer"
--       vim.tbl_map(function(plugin) packer.loader(plugin) , racsonvim.git_plugins)
--     end
--   end,
-- })

-- format on save
cmd("BufWritePost", {
  callback = function()
    vim.lsp.buf.format({
      async = true,
      filter = function(
    client
      )
        if client.name
            == "tsserver"
        then
          vim.cmd(
            ":EslintFixAll"
          )
          return false
        end

        return true
      end,
    })
  end,
})

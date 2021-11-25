local api = vim.api

local M = {}

function M.OpenTerminal()
  if vim.bo[0]=='terminal' then
    api.nvim_command('q')
    else
    api.nvim_command('vsp term://zsh') -- equivalent to :enew
    vim.bo[0].buftype='nofile' -- set the current buffer's (buffer 0) buftype to nofile
    vim.bo[0].bufhidden='hide'
    vim.bo[0].swapfile=false
end
end

return M





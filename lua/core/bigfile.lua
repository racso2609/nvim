-- Big file optimizations
-- Disables heavy features when opening files larger than 1 MB

local BIG_FILE_THRESHOLD = 1024 * 1024 -- 1 MB

local bigfile_group = vim.api.nvim_create_augroup("BigFile", { clear = true })

local function is_big_file(bufnr)
  local ok, size = pcall(vim.fn.getfsize, vim.api.nvim_buf_get_name(bufnr))
  if not ok or size < 0 then
    return false
  end
  return size > BIG_FILE_THRESHOLD
end

local function disable_for_bigfile(bufnr)
  vim.b[bufnr].bigfile = true

  -- Disable swap/undo for the buffer
  vim.bo[bufnr].swapfile = false
  vim.bo[bufnr].undofile = false

  -- Reduce visual overhead
  -- vim.bo[bufnr].relativenumber = false
  vim.bo[bufnr].foldmethod = "manual"
  vim.bo[bufnr].foldexpr = "0"

  -- Stop treesitter highlighting and indent (main branch / Neovim 0.10+)
  vim.treesitter.stop(bufnr)

  -- Reset indentexpr to default
  vim.bo[bufnr].indentexpr = ""

  -- Stop LSP clients for this buffer
  local clients = vim.lsp.get_clients({ bufnr = bufnr })
  for _, client in ipairs(clients) do
    vim.lsp.buf_detach_client(bufnr, client.id)
  end

  -- Disable indent-blankline if loaded
  local ok, ibl = pcall(require, "ibl")
  if ok then
    pcall(ibl.setup_buffer, bufnr, { enabled = false })
  end

  -- Disable gitsigns if loaded
  local gs_ok, gitsigns = pcall(require, "gitsigns")
  if gs_ok then
    pcall(gitsigns.detach, bufnr)
  end

  -- Notify plugins that care
  vim.api.nvim_exec_autocmds("User", {
    pattern = "BigFile",
    data = { buf = bufnr },
  })

  vim.schedule(function()
    vim.notify("Big file mode enabled (disabled treesitter, LSP, etc.)", vim.log.levels.INFO)
  end)
end

vim.api.nvim_create_autocmd({ "BufReadPre" }, {
  group = bigfile_group,
  callback = function(args)
    local bufnr = args.buf
    if is_big_file(bufnr) then
      disable_for_bigfile(bufnr)
    end
  end,
})

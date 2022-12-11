local status, mason = pcall(require, "mason")
if (not status) then return end

local status1, masonConfig = pcall(require, "mason-lspconfig")
if (not status1) then return end

local status2, lspconfig = pcall(require, "lspconfig")
if (not status2) then return end

mason.setup()

require("mason-tool-installer").setup {
  ensure_installed = { "codelldb", "stylua", "shfmt", "shellcheck", "black", "isort", "prettierd" },
  auto_update = false,
  run_on_start = true,
}
-- Package installation folder
-- local install_root_dir = vim.fn.stdpath "data" .. "/mason"

masonConfig.setup_handlers {
  function(server_name)
    lspconfig[server_name].setup({})
  end,
}

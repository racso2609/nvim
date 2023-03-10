local configNullLs = function()
  local null_ls = racsonvim.safeRequire("null-ls")

  local formatting = null_ls.builtins.formatting
  local code_actions = null_ls.builtins.code_actions
  local completion = null_ls.builtins.completion
  local diagnostics = null_ls.builtins.diagnostics

  local sources = {
    --[[ formatting ]]
    formatting.eslint,
    formatting.autopep8,
    formatting.stylua,
    formatting.clang_format,
    formatting.stylelint,
    formatting.prettier,
    formatting.phpcbf,
    formatting.trim_newlines,
    formatting.trim_whitespace,
    --[[ code actions ]]
    code_actions.eslint_d,

    -- spell
    completion.spell,
    diagnostics.codespell,
    diagnostics.solhint,
  }

  local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
      timeout = 5000,
      filter = function(client)
        print(client.name)
        if client.name == "tsserver" then
          vim.cmd(":EslintFixAll")
          return false
        end
        -- apply whatever logic you want (in this example, we'll only use null-ls)
        return client.name == "null-ls"
      end,
      bufnr = bufnr,
    })
  end

  -- if you want to set up formatting on save, you can use this as a callback
  local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

  local on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          lsp_formatting(bufnr)
        end,
      })
    end
  end

  null_ls.setup({
    debug = true,
    sources = sources,
    on_attach = on_attach,
  })
end

return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    lazy = true,
    event = { "BufRead" },
    config = configNullLs,
  },
}

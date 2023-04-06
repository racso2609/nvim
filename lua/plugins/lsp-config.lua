return {
  {
    -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    lazy = true,
    event = {
      "BufRead",
    },
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      {
        "williamboman/mason.nvim",
        config = true,
      },
      {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        opts = {
          ensure_installed = {
            "codelldb",
            "stylua",
            "black",
            "prettier",
            "eslint-lsp",
            "solidity",
            "luaformatter",
            "typescript-language-server",
            "lua-language-server",
          },
          auto_update = true,
          run_on_start = true,
        },
      },
      {
        "williamboman/mason-lspconfig.nvim",
        config = function()
          local on_attach = function(client, bufnr)
            -- Enable completion triggered by <c-x><c-o>
            vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
            vim.api.nvim_exec_autocmds("User", {
              pattern = "LspAttached",
            })
            -- disable lsp formatting to use null-ls
            client.server_capabilities.document_formatting = false
            client.server_capabilities.document_range_formatting = false

            -- Create a command `:Format` local to the LSP buffer
            vim.api.nvim_buf_create_user_command(bufnr, "Format", racsonvim.lsp_formatting(bufnr), {
              desc = "Format current buffer with LSP",
            })
          end
          local capabilities = vim.lsp.protocol.make_client_capabilities()
          local masonConfig = racsonvim.safeRequire("mason-lspconfig")
          local lspconfig = racsonvim.safeRequire("lspconfig")

          masonConfig.setup_handlers({
            function(server_name)
              if server_name == "efm" then
                lspconfig[server_name].setup({
                  init_options = {
                    documentFormatting = true,
                  },
                  settings = {
                    rootMarkers = {
                      ".git/",
                    },
                  },
                })
              elseif server_name == "lua_ls" then
                lspconfig[server_name].setup({
                  on_attach = on_attach,
                  capabilities = capabilities,
                  settings = {
                    Lua = {
                      diagnostics = {
                        globals = {
                          "vim",
                          "racsonvim",
                        },
                      },
                      path = {
                        "?.lua",
                        "?/init.lua",
                        vim.fn.expand("~/.luarocks/share/lua/5.3/?.lua"),
                        vim.fn.expand("~/.luarocks/share/lua/5.3/?/init.lua"),
                        "/usr/share/5.3/?.lua",
                        "/usr/share/lua/5.3/?/init.lua",
                      },
                      workspace = {
                        -- Make the server aware of Neovim runtime files
                        library = vim.api.nvim_get_runtime_file("", true),
                        checkThirdParty = false,
                      },
                    },
                  },
                })
              elseif server_name == "solc" then
                lspconfig.solc.setup({
                  on_attach = on_attach,
                  capabilities = capabilities,
                  settings = {
                    cmd = {
                      "nomicfoundation-solidity-language-server",
                      "--stdio",
                    },
                    filetypes = {
                      "solidity",
                    },
                    root_dir = require("lspconfig.util").find_git_ancestor,
                    single_file_support = true,
                  },
                })
              else
                lspconfig[server_name].setup({
                  on_attach = on_attach,
                  capabilities = capabilities,
                })
              end
            end,
          })
        end,
      },
    },
    keys = {
      {
        "<leader>D",
        vim.lsp.buf.type_definition,
        desc = "Type definition",
      },
      {
        "<leader>r",
        vim.lsp.buf.rename,
        desc = "Rename variables",
      },
      {
        "<C-k>",
        vim.lsp.buf.hover,
        desc = "open hover help",
      },
      {
        "K",
        vim.lsp.buf.signature_help,
        desc = "open help",
      },
      {
        "gd",
        vim.lsp.buf.definition,
        desc = "Goto definition",
      },
      {
        "gD",
        vim.lsp.buf.declaration,
        desc = "go to declaration",
      },
      {
        "gi",
        vim.lsp.buf.implementation,
        desc = "go to implementation",
      },
      {
        "<C-f>",
        vim.lsp.buf.format,
        desc = "format document",
      },
    },
  },
}

local status_tabnine, tabnine = pcall(require, "cmp_tabnine.config")
if (not status_tabnine) then return end

tabnine.setup({
  max_lines = 1000;
  max_num_results = 50;
  sort = true;
  run_on_every_keystroke = true;
  snippet_placeholder = '..';
})

local status_lspkind, lspkind = pcall(require, "lspkind")
if (not status_lspkind) then return end

lspkind.init({
  preset = 'codicons',
  mode = 'symbol_text',
  symbol_map = {
    Class = "ﴯ",
    Color = "",
    Constant = "",
    Constructor = "",
    Enum = "",
    EnumMember = "",
    Event = "",
    Field = "",
    File = "",
    Folder = "",
    Function = "",
    Interface = "",
    Keyword = "",
    Method = "",
    Module = "",
    Operator = "",
    Property = "ﰠ",
    Reference = "",
    Snippet = "",
    Struct = "",
    Text = "",
    TypeParameter = "",
    Unit = "",
    Value = "",
    Variable = "",
  },
})
local status, cmp = pcall(require, "cmp")
if (not status or not cmp) then return end

cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  formatting = { format = lspkind.cmp_format() },

  sources = cmp.config.sources {
    { name = 'path' },
    { name = 'nvim_lsp', keyword_length = 3 },
    { name = 'cmp_tabnine', keyword_length = 3 },
    { name = 'ultisnips', keyword_length = 2 }, -- For ultisnips users.
    { name = 'buffer' },
    { name = "nvim_lsp_signature_help" },
    { name = 'plugins' },
  },
}

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

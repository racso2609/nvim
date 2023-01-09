local treesitter = racsonvim.safeRequire "nvim-treesitter.configs"

treesitter.setup({
  ensure_installed = { 'rust', 'lua', 'javascript', 'typescript' },
  highlight = {
    enable = true, -- false will disable the whole extension
    -- disable = { 'json' }, -- list of language that will be disabled
  },
  indent = { enable = true },
  autopairs = { enable = true },
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
  },
  autotag = { enable = true },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
})

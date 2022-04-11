

--local ts = require 'nvim-treesitter.configs'
--ts.setup{
--   ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
--  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
--  ignore_install = { "solidity" }, -- List of parsers to ignore installing
--  highlight = {
--    enable = true,              -- false will disable the whole extension
--    disable = { "rust","solidity" },  -- list of language that will be disabled
--    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
--    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
--    -- Using this option may slow down your editor, and you may see some duplicate highlights.
--    -- Instead of true it can also be a list of languages
--    additional_vim_regex_highlighting = true,
--  },
--}


require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "rust", "javascript", "solidity" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing (for "all")
  ignore_install = {  },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these ar the names of the parsers and not the filetype. (for example if you want to
    --disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    --the name of the parser)
    -- list of language that will be disabled
    disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
  },
}

require('nvim-ts-autotag').setup()

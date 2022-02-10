-- pacman -S solidity
-- npm i -g solc
require'lspconfig'.solc.setup{}


require "nvim-treesitter.parsers".get_parser_configs().solidity = {
    install_info = {
      url = "https://github.com/JoranHonig/tree-sitter-solidity",
      files = {"src/parser.c"},
      requires_generate_from_grammar = false,
    },
    filetype = 'solidity'
  }

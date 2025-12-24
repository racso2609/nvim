# Neovim Configuration

This is my personal Neovim configuration using LazyVim.

## Installation

1. Clone this repository into your Neovim config directory:
   ```bash
   git clone https://github.com/racso2609/nvim ~/.config/nvim
   ```

2. Open Neovim and let Lazy install plugins.

## Requirements

- Neovim 0.9 or higher
- LazyVim plugin manager

## Plugins

This configuration includes the following plugins:

- **nvim-cmp**: Completion engine
- **telescope**: Fuzzy finder and picker
- **nvim-treesitter**: Syntax highlighting and parsing
- **lualine**: Status line
- **nvim-tree**: File explorer
- **mason**: LSP server installer
- **lsp-config**: LSP configuration
- **copilot**: AI-powered code completion
- **autopairs**: Auto-closing pairs
- **formatting**: Code formatting
- **git**: Git integration
- **themes**: Theme support

## Features

- LSP support
- AI integration (Copilot)
- Custom snippets
- Theme support
- And more...

## Keybindings

### General
- `<C-n>`: Toggle relative line number
- `<C-l>`: Clear highlights
- `<C-s>`: Save file
- `<C-q>`: Close window
- `<C-a>`: Select all
- `<C-z>`: Redo
- `L`: Select until end of word
- `H`: Select until start of word

### LSP
- `gd`: Go to definition
- `<leader>ds`: Show buffer diagnostics

### Formatting
- `<leader>mp`: Format file or range
- `<C-f>`: Format current buffer

### Completion (Insert Mode)
- `<C-k>`: Select previous suggestion
- `<C-j>`: Select next suggestion
- `<C-b>`: Scroll docs up
- `<C-f>`: Scroll docs down
- `<C-Space>`: Show completion suggestions
- `<C-e>`: Close completion window
- `<CR>`: Confirm selection

### Telescope (Fuzzy Finder)
- `<leader>tb`: Search buffers
- `<leader>tT`: Find in current directory
- `<leader>tt`: Find in root project
- `<leader>tsb`: Find in current buffer
- `<leader>tfF`: Search file in current dir
- `<leader>tff`: Search file in root dir
- `<leader>tfr`: Search recent files
- `<leader>tgcm`: Search commits
- `<leader>tgs`: Search modified files
- `<leader>tcs`: Colorschemes
- `<leader>tch`: Command history
- `<leader>tcc`: Search commands
- `/`: Search in current buffer

### NvimTree (File Explorer)
- `<C-b>`: Toggle file explorer
- `<leader>ef`: Toggle file explorer on current file
- `<leader>ec`: Collapse file explorer
- `<leader>er`: Refresh file explorer

### Git
- `<leader>gd`: Open Neogit dashboard
- `<leader>gDo`: Open DiffView
- `<leader>gDc`: Close DiffView

### AI & OpenCode
- `<C-a>`: Accept Copilot suggestion
- `<leader>aa`: Toggle OpenCode
- `<leader>as`: OpenCode select
- `<leader>ai`: OpenCode ask
- `<leader>aI`: OpenCode ask with context
- `<leader>ab`: OpenCode ask about buffer
- `<leader>ap`: OpenCode prompt
- `<leader>ape`: OpenCode explain
- `<leader>apf`: OpenCode fix
- `<leader>apd`: OpenCode diagnose
- `<leader>apr`: OpenCode review
- `<leader>apt`: OpenCode test
- `<leader>apo`: OpenCode optimize

Refer to the Lua files for detailed configuration.
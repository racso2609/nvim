-- Set lualine as statusline
-- See `:help lualine.txt`
local lualine = racsonvim.safeRequire "lualine"
lualine.setup {
  options = {
    icons_enabled = false,
    theme = 'onedark',
    component_separators = '|',
    section_separators = '',
  },
}

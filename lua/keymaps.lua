local map = require('functions').map
local g = vim.g;

-- " Open the current file in the default program
map('n','<C-x>', '<cmd>:!xdg-open %<cr>')
map('', '<C-z>', '<C-g>u<C-u>')  -- Make <C-u> undo-friendly
map('', '<C-m-z>', '<cmd>:redo<cr>')  -- Make <C-u> undo-friendly
map('','<C-M-r>','<cmd>:source ~/.config/nvim/init.lua<cr>')


-- <Tab> to navigate the completion menu
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})

map('n', '<C-l>', '<cmd>noh<CR>')    -- Clear highlights
map('n', '<C-s>', '<cmd>:w<CR>')    -- save
map('n', '<C-q>', '<cmd>:q<CR>')    -- quit

-- Use alt + hjkl to resize windows
map ('n','<C-M-Down>', '<cmd>:resize -2<CR>')
map ('n','<C-M-Up>', '<cmd>:resize +2<CR>')
map('n','<C-M-Left>',  '<cmd>:vertical resize -2<CR>')
map('n','<C-M-Right>', '<cmd>:vertical resize +2<CR>')

map ('n','<C-Left>','<C-w>h')
map ('n','<C-Down>','<C-w>j')
map ('n','<C-Up>','<C-w>k')
map ('n','<C-Right>','<C-w>l')



-- Tree --

map ('n','<C-b>' ,'<cmd>NvimTreeToggle<CR>')

-- Float Term --

g.floaterm_keymap_toggle = '<c-a>'

g.floaterm_gitcommit='floaterm'
g.floaterm_autoinsert=1
g.floaterm_width=0.8
g.floaterm_height=0.8
g.floaterm_wintitle=0
g.floaterm_autoclose=1

-- UltiSnips

g.UltiSnipsExpandTrigger="<C-space>"
g.UltiSnipsSnippetsDir="~/.config/nvim/snippets"
g.UltiSnipsListSnippets="<C-l>"
g.UltiSnipsJumpForwardTrigger= '<tab>'
g.UltiSnipsJumpBackwardTrigger= '<s-tab>'

-- "emmet-vim
--
g.user_emmet_mode='a'
g.user_emmet_leader_key='<C-a>'

-- git --
-- instal coc-git

map ('n','gc','<cmd>:CocList commits<CR>')
map ('n','gb','<cmd>:CocCommand git.browserOpen<CR>')

-- eslint --
-- install coc-eslint
map ('n','ef','<cmd>:CocCommand eslint.executeAutofix<CR>');
map ('n','ec','<cmd>:CocCommand eslint.createConfig<CR>');


-- prettier --
-- install coc-prettier
map ('n',"cp",'<cmd>:CocCommand prettier.createConfigFile<CR>');
map ('n','fp','<cmd>:CocCommand prettier.formatFile<CR>');



-- swapper -- 
-- install coc-swapper
map ('n','<C-M-s>','<cmd>:CocCommand swagger.render<CR>');

-- svg --
-- install coc-svg
map ('n','ssvg','<cmd>:CocCommand svg.showSvg<CR>');

-- tabnine --
-- install coc-tabnine

map ('n','tc','<cmd>:CocCommand tabnine.openConfig<CR>');
map ('n','th','<cmd>:CocCommand tabnine.openHub<CR>');

-- telescope --
--

map ('n','<C-f>','<cmd>:Telescope find_files<CR>');
map ('n','<C-t>','<cmd>:Telescope live_grep<CR>');
map ('n','<C-M-b>','<cmd>:Telescope buffers<CR>');
map ('n','<C-h>','<cmd>:Telescope help_tags<CR>');

-- which key --


-- dashboard --
--

g.dashboard_default_executive ='telescope';
--g.dashboard_custom_shortcut={
-- 'last_session'       : 'SPC s l',
-- 'find_history'       : 'SPC f h',
-- 'find_file'          : 'SPC f f',
-- 'new_file'           : 'SPC c n',
-- 'change_colorscheme' : 'SPC t c',
-- 'find_word'          : 'SPC f a',
-- 'book_marks'         : 'SPC f b',
-- };


-- Todo comments --
map ('n','ft','<cmd>:TodoQuickFix<CR>');

-- vimwiki --



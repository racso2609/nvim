local map = require('functions').map
local g = vim.g;

-- coc-format
map ("n","<space>ff" ,":CocCommand editor.action.formatDocument<cr>");
-- Delete a word backwards
map('n', 'dw', 'vb"_d')

-- Select all
map('n', '<C-a>', 'gg<S-v>G')

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})
--

-- Split window
map('n', 'ss', ':split<Return><C-w>w')
map('n', 'sv', ':vsplit<Return><C-w>w')

-- Use alt + hjkl to resize windows
map ('n','<C-M-Down>', '<cmd>:resize -2<CR>')
map ('n','<C-M-Up>', '<cmd>:resize +2<CR>')
map('n','<C-M-Left>',  '<cmd>:vertical resize -2<CR>')
map('n','<C-M-Right>', '<cmd>:vertical resize +2<CR>')

-- Use alt + hjkl to move into windows
map ('n','<C-Left>','<C-w>h')
map ('n','<C-Down>','<C-w>j')
map ('n','<C-Up>','<C-w>k')
map ('n','<C-Right>','<C-w>l')

-- " Open the current file in the default program
map('n','<C-x>', '<cmd>:!xdg-open %<cr>')

-- Make <C-u> undo-friendly
map('', '<C-z>', '<C-g>u<C-u>')

-- Make <C-u> undo-friendly
map('', '<C-m-z>', '<cmd>:redo<cr>')

-- restart vim config
map('n','rc','<cmd>:source ~/.config/nvim/init.lua<cr>')

-- prev and next buffer
map('n','<space>bn','<cmd>:bn<cr>')
map('n','<space>bp','<cmd>:bp<cr>')
-- todo
map('n','<space>t',':Telekasten<cr>')

-- Clear highlights
map('n', '<C-l>', '<cmd>noh<CR>')

-- save
map('n', '<C-s>', '<cmd>:w<CR>')

-- quit
map('n', '<C-q>', '<cmd>:q<CR>')


-- Tree --
map ('n','<C-b>' ,'<cmd>NvimTreeToggle<CR>')


-- Float Term --
-- map ('n','<C-a>' ,'<cmd>:FloatermToggle<CR>')

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
g.UltiSnipsListSnippets="<space>sl";

-- "emmet-vim
g.user_emmet_mode='a'
g.user_emmet_leader_key='<C-a>'

-- git --
-- instal coc-git

map ('n','gco','<cmd>:CocList commits<CR>')
map ('n','gb','<cmd>:CocCommand git.browserOpen<CR>')

-- eslint --
-- install coc-eslint
map ('n','ef','<cmd>:CocCommand eslint.executeAutofix<CR>');
map ('n','ec','<cmd>:CocCommand eslint.createConfig<CR>');


-- prettier --
-- install coc-prettier
map ('n',"cp",'<cmd>:CocCommand prettier.createConfigFile<CR>');

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
map ('n','<space>p','<cmd>:Telescope neoclip<CR>');
map ('n','<space>m','<cmd>:Telescope media_files<CR>');

-- comment
map ('n','<C-c>','<cmd>:CommentToggle<CR>');

-- which key --


-- dashboard --
--

g.dashboard_default_executive ='telescope';
-- g.dashboard_custom_shortcut={
--  'last_session'       : 'SPC s l',
--  'find_history'       : 'SPC f h',
--  'find_file'          : 'SPC f f',
--  'new_file'           : 'SPC c n',
--  'change_colorscheme' : 'SPC t c',
--  'find_word'          : 'SPC f a',
--  'book_marks'         : 'SPC f b',
--  };


-- Todo comments --
map ('n','ft','<cmd>:TodoQuickFix<CR>');

-- vimwiki --
--
-- coc --

-- " GoTo code navigation.
map  ("n","gd", "<Plug>(coc-definition)");
map  ("n","gy" ,"<Plug>(coc-type-definition)");
map  ("n","gi" ,"<Plug>(coc-implementation)");
map  ("n","gr" ,"<Plug>(coc-references)");

map ("n","<space>c",":<C-u>CocList commands<cr>");
map ("n","<space>e",":<C-u>CocList extensions<cr>");
map ("n","<space>s",":<C-u>CocList snippets<cr>");
map ("n","<space>d",":<C-u>CocList diagnostic<cr>");
map ("n","<space>l",":<C-u>CocList lists<cr>");

map ("n","<space>gc",":<C-u>CocList commits<cr>");
map ("n","<space>gfc",":<C-u>CocList bcommits<cr>");
map ("n","<space>gs",":<C-u>CocList gstatus<cr>");
map ("n","<space>gb",":<C-u>CocList branches<cr>");



-- git
map('n','<space>gd',':Neogit<cr>')

-- rust
map('n','<space>rr',':CocCommand rust-analyzer.run<cr>')
map('n','<space>rc',':CocCommand rust-analyzer.openCargoToml<cr>')

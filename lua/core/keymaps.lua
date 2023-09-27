-- leader key
vim.g.mapleader = " "


local opts = { noremap = true, silent = true }
-- snippets
racsonvim.setKeymap('n', '<leader>sa', ":UltiSnipsAddFileTypes<cr>", opts, "Add snippet fileType")
racsonvim.setKeymap('n', '<leader>se', ":UltiSnipsEdit<cr>", opts, "Edit snippet file type")

-- note taking
racsonvim.setKeymap('n', '<leader>nf', ":lua require('telescope.builtin').find_files({cwd =" .. "'/home/racso/notes'})<cr>", opts, "Fuzzy find notes")

-- NvimTree 
racsonvim.setKeymap('n', '<C-b>', "<cmd>Explore<cr>", opts, "Open file explorer")

-- basic
racsonvim.setKeymap('n', '<C-l>', ":noh<cr>", opts, "Clear highlights")
racsonvim.setKeymap('n', '<C-s>', ":w!<cr>", opts, "save")
racsonvim.setKeymap('n', '<C-q>', ":q<cr>", opts, "close")
racsonvim.setKeymap('n', '<C-a>', ":gg<S-v>G<cr>", opts, "select all")
racsonvim.setKeymap('n', '<C-z>', ":undo<cr>", opts, "select all")
racsonvim.setKeymap('n', '<C-M-z>', ":redo<cr>", opts, "select all")

--resize windows
--- vertical
racsonvim.setKeymap('n', '<C-M-Down>', ":resize -2<cr>", opts, "resize Down")
racsonvim.setKeymap('n', '<C-M-Up>', ":resize +2<cr>", opts, "resize Up")
--- horizontal
racsonvim.setKeymap('n', '<C-M-Left>', ":vertical resize -2<cr>", opts, "resize Left")
racsonvim.setKeymap('n', '<C-M-Right>', ":vertical resize +2<cr>", opts, "resize Right")

-- move from buffers
----- vertical
racsonvim.setKeymap('n', '<C-Down>', ":<C-w>j<cr>", opts, "move Down")
racsonvim.setKeymap('n', '<C-Up>', ":<C-w>k<cr>", opts, "move Up")
--- horizontal
racsonvim.setKeymap('n', '<C-Left>', ":<C-w>h<cr>", opts, "move Left")
racsonvim.setKeymap('n', '<C-Right>', ":<C-w>l<cr>", opts, "move Right")






-- local shortcuts = {
-- 	{
-- 		activator = "",
-- 		name = "Direct keymaps",
-- 		keymaps = {
-- 			{
-- 				prefix = "",
-- 				commands = {
-- 					-- custom shortcuts
-- 					-- {
-- 					--	key = "dw",
-- 						--command = 'vb"_d',
-- 						--name = "delete back word",
-- 					--},
-- 					-- redo and undo
-- 					-- {
-- 					-- 	key = "<C-r>",
-- 					-- 	command = ":source %<cr>",
-- 					-- 	name = "charge actual file",
-- 					-- },
-- 				},
-- 			},
-- 		},
-- 	},
-- }
-- keymaps.setup(shortcuts)

-- "emmet-vim
-- g.user_emmet_mode = "a"
-- g.user_emmet_leader_key = "<C-a>"

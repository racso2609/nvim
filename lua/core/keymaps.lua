-- cspell: disable
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local keymaps = racsonvim.safeRequire("keymaps-nvim")

local opts = { noremap = true, silent = true }
local shortcuts = {
	{
		activator = "<space>",
		keymaps = {
			{
				prefix = "s",
				name = "snippets",
				commands = {
					{
						key = "a",
						command = ":UltiSnipsAddFileTypes<cr>",
						name = "Add snippet file",
					},
					{
						key = "e",
						command = ":UltiSnipsEdit<cr>",
						name = "Edit snippet file",
					},
				},
			},

			{
				prefix = "n",
				name = "Notes / Todo",
				commands = {
					{
						key = "n",
						command = ":lua require('telescope.builtin').find_files({cwd =" .. "'/home/racso/notes'})<cr>",
						name = "Find files",
					},
				},
			},
		},
	},
	{
		activator = "",
		name = "Direct keymaps",
		keymaps = {
			{
				prefix = "",
				commands = {
					{
						key = "<C-b>",
						command = "<cmd>NvimTreeToggle<cr>",
						name = "Open nvim tree lua",
					},
					{
						key = "<C-l>",
						command = ":noh<cr>",
						name = "Clear highlights",
					},
					-- save close
					{
						key = "<C-s>",
						command = ":w<cr>",
						name = "Save",
					},
					{
						key = "<C-q>",
						command = ":q<cr>",
						name = "Close",
					},
					-- split
					{
						key = "ss",
						command = ":split<Return><c-w>w",
						name = "Horizontal split",
					},
					{
						key = "sv",
						command = ":vsplit<Return><c-w>w",
						name = "Vertical split",
					},
					-- resize
					{
						key = "<C-M-Down>",
						command = ":resize -2<cr>",
						name = "resize to bottom",
					},
					{
						key = "<C-M-Up>",
						command = ":resize +2<cr>",
						name = "resize to top",
					},
					{
						key = "<C-M-Left>",
						command = ":vertical resize -2<cr>",
						name = "resize to left",
					},
					{
						key = "<C-M-Right>",
						command = ":vertical resize +2<cr>",
						name = "resize to right",
					},
					-- move on buffers
					{
						key = "<C-Down>",
						command = "<C-w>j",
						name = "move to bottom buffers",
					},
					{
						key = "<C-Up>",
						command = "<C-w>k",
						name = "move to top buffer",
					},
					{
						key = "<C-Left>",
						command = "<C-w>h",
						name = "move to left buffer",
					},
					{
						key = "<C-Right>",
						command = "<C-w>l",
						name = "move to right buffer",
					},
					-- custom shortcuts
					{
						key = "dw",
						command = 'vb"_d',
						name = "delete back word",
					},
					{
						key = "<C-a>",
						command = "gg<S-v>G",
						name = "select all",
					},
					-- redo and undo
					{
						key = "<C-z>",
						command = "<C-g>u<C-u>",
						name = "undo",
					},
					{
						key = "<C-m-z>",
						command = ":redo",
						name = "redo",
					},
					{
						key = "<C-r>",
						command = ":source %<cr>",
						name = "charge actual file",
					},
				},
			},
		},
	},
}
keymaps.setup(shortcuts)

-- "emmet-vim
-- g.user_emmet_mode = "a"
-- g.user_emmet_leader_key = "<C-a>"

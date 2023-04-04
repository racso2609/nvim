return {
	{
		"terrortylor/nvim-comment",
		name = "nvim_comment",
		opts = {
			-- Linters prefer comment and line to have a space in between markers
			marker_padding = true,
			-- should comment out empty or whitespace only lines
			comment_empty = true,
			-- trim empty comment whitespace
			comment_empty_trim_whitespace = true,
			-- Should key mappings be created
			create_mappings = true,
			-- Normal mode mapping left hand side
			line_mapping = "gcc",
			-- Visual/Operator mapping left hand side
			operator_mapping = "gc",
			-- text object mapping, comment chunk,,
			comment_chunk_text_object = "ic",
			-- Hook function to call before commenting takes place
			hook = function()
				require("ts_context_commentstring.internal").update_commentstring()
			end,
		},
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		keys = {
			{
				"<C-c>",
				"<cmd>CommentToggle<cr>",
				desc = "Quick comment line",
			},
		},
	},
	{
		"folke/todo-comments.nvim",
		lazy = false,
		config = function()
			require("todo-comments").setup()
		end,
	},
}

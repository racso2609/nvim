_G.racsonvim = {}

--- format buffers
--- @param bufnr number of the actual buffer
function racsonvim.lsp_formatting(bufnr)
	require("conform").format({ bufnr = bufnr })
	-- vim.lsp.buf.format({
	-- 	async = true,
	-- 	-- name = "efm",
	-- 	filter = function(client)
	-- 		print(client.name)
	-- 		return client.name == "efm"
	-- 	end,
	-- 	bufnr = bufnr,
	-- })
end

--- show messages to  user
-- @param msg message to show
-- @param message type message
-- @param opts the new options that should be merged with the default table
-- @return the merged table
function racsonvim.notify(msg, type)
	vim.schedule(function()
		vim.notify(msg, type)
	end)
end

--- Delete the syntax matching rules for URLs/URIs if set
function racsonvim.delete_url_match()
	for _, match in ipairs(vim.fn.getmatches()) do
		if match.group == "HighlightURL" then
			vim.fn.matchdelete(match.id)
		end
	end
end

--- Add syntax matching rules for highlighting URLs/URIs
function racsonvim.set_url_match()
	racsonvim.delete_url_match()
	if vim.g.highlighturl_enabled then
		vim.fn.matchadd("HighlightURL", racsonvim.url_matcher, 15)
	end
end

-- @param library to import
function racsonvim.safeRequire(library)
	local status, import = pcall(require, library)
	if not status then
		local msg = "fail " .. library .. " import"
		racsonvim.notify(msg, "error")
		return status
	end
	return import
end

function racsonvim.setKeymap(mode, rhls, cmd, opts, description)
	local whichKey = racsonvim.safeRequire("which-key")
	if description and whichKey then
		whichKey.register({
			[rhls] = { cmd, description },
		})
	end

	vim.keymap.set(mode, rhls, cmd, opts)
end

racsonvim.lspFormattingGroup = vim.api.nvim_create_augroup("LspFormatting", {})

function racsonvim.on_attach(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({
			group = racsonvim.lspFormattingGroup,
			buffer = bufnr,
		})
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = racsonvim.lspFormattingGroup,
			buffer = bufnr,
			callback = function()
				racsonvim.lsp_formatting(bufnr)
			end,
		})
		vim.api.nvim_buf_create_user_command(bufnr, "Format", function()
			racsonvim.lsp_formatting(bufnr)
		end, {
			desc = "Format current buffer with LSP",
		})
	end
end

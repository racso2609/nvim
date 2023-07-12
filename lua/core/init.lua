_G.racsonvim = {}

--- format buffers
--- @param bufnr number of the actual buffer
function racsonvim.lsp_formatting(bufnr)
	-- require("lsp-format").on_attach(client)
	vim.lsp.buf.format({
		-- name = client.name,
		async = true,
		-- timeout = 5000,
		filter = function(client)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

--- show messages to  user
-- @param msg message to show
-- @param message type message
-- @param opts the new options that should be merged with the default table
-- @return the merged table
function racsonvim.notify(msg, type, opts)
	vim.schedule(function()
		vim.notify(
			msg,
			type,
			racsonvim.default_tbl(opts, {
				title = "RacsoNvim",
			})
		)
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
		error(msg)
	end
	return import
end

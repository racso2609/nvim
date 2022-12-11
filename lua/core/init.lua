_G.racsonvim = {}

 local stdpath = vim.fn.stdpath

racsonvim.install = { home = stdpath "config" }
racsonvim.git_plugins = {}

racsonvim.url_matcher =
"\\v\\c%(%(h?ttps?|ftp|file|ssh|git)://|[a-z]+[@][a-z]+[.][a-z]+:)%([&:#*@~%_\\-=?!+;/0-9a-z]+%(%([.;/?]|[.][.]+)[&:#*@~%_\\-=?!+/0-9a-z]+|:\\d+|,%(%(%(h?ttps?|ftp|file|ssh|git)://|[a-z]+[@][a-z]+[.][a-z]+:)@![0-9a-z]+))*|\\([&:#*@~%_\\-=?!+;/.0-9a-z]*\\)|\\[[&:#*@~%_\\-=?!+;/.0-9a-z]*\\]|\\{%([&:#*@~%_\\-=?!+;/.0-9a-z]*|\\{[&:#*@~%_\\-=?!+;/.0-9a-z]*})\\})+"


--- Merge extended options with a default table of options
-- @param opts the new options that should be merged with the default table
-- @param default the default table that you want to merge into
-- @return the merged table
function racsonvim.default_tbl(opts, default)
  opts = opts or {}
  return default and vim.tbl_deep_extend("force", default, opts) or opts
end

--- show messages to  user
-- @param msg message to show
-- @param message type message
-- @param opts the new options that should be merged with the default table
-- @return the merged table
function racsonvim.notify(msg, type, opts)
  vim.schedule(function() vim.notify(msg, type, racsonvim.default_tbl(opts, { title = "RacsoNvim" })) end)
end

--- Check if a plugin is defined in packer. Useful with lazy loading when a plugin is not necessarily loaded yet
-- @param plugin the plugin string to search for
-- @return boolean value if the plugin is available
function racsonvim.is_available(plugin) return packer_plugins ~= nil and packer_plugins[plugin] ~= nil end

--- Delete the syntax matching rules for URLs/URIs if set
function racsonvim.delete_url_match()
  for _, match in ipairs(vim.fn.getmatches()) do
    if match.group == "HighlightURL" then vim.fn.matchdelete(match.id) end
  end
end

--- Add syntax matching rules for highlighting URLs/URIs
function racsonvim.set_url_match()
  racsonvim.delete_url_match()
  if vim.g.highlighturl_enabled then vim.fn.matchadd("HighlightURL", racsonvim.url_matcher, 15) end
end

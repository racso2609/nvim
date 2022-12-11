 local status, prettier  = pcall(require, "prettier")
 if (not status) then return end
 -- local exist = prettier.config_exists({ check_package_json = true })
 
 prettier.setup({
   bin = 'prettier', -- or `'prettierd'` (v0.22+)
   filetypes = {
     "css",
     "graphql",
     "html",
     "javascript",
     "javascriptreact",
     "json",
     "less",
     "markdown",
     "scss",
     "typescript",
     "typescriptreact",
     "yaml",
   },
   ["null-ls"] = {
     condition = function()
      return true
     end,
     -- runtime_condition = function(params)
     -- return false to skip running prettier
     -- return true
     -- end,
     timeout = 5000
   }
 })

local status, telescope= pcall(require, "telescope")
if (not status) then return end

telescope.setup({
 extensions = {
    media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      filetypes = {"png", "webp", "jpg", "jpeg"},
      find_cmd = "rg" -- find command (defaults to `fd`)
    }
  },
})
telescope.load_extension('media_files')
telescope.load_extension('neoclip')

local status2, neoclip = pcall(require, "neoclip")
if (not status2) then return end
neoclip.setup()



local status, cairo = pcall(require, "cairo-support-nvim")
if not status then
  return
end

cairo.setup({
  format = true,
  compile = true,
  environment = "nexera_cairo",
})

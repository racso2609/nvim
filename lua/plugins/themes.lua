return {
  -- "rafamadriz/neon",
  -- "Mofiqul/vscode.nvim",
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    "echasnovski/mini.icons",
    version = false,
    config = function()
      require("mini.icons").setup()
    end,
  },
  -- "ribru17/bamboo.nvim",
}

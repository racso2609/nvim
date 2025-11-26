return {
  {
    "folke/which-key.nvim",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300

      local whichKey = racsonvim.safeRequire("which-key")

      if not whichKey then
        return
      end

      local mapping = {
        { "<leader>d", desc = "Diagnostic" },
        { "<leader>g", desc = "git" },
        { "<leader>l", desc = "languages" },
        { "<leader>n", desc = "notes" },
        { "<leader>s", desc = "Snippets" },
        { "<leader>t", desc = "telescope" },
        { "<leader>tc", desc = "commands and colorschemes" },
        { "<leader>tf", desc = "Files" },
        { "<leader>tg", desc = "github" },
        { "<leader>tgc", desc = "copilot" },
        { "<leader>ts", desc = "search" },
        { "<leader>c", desc = "checkpoint/harpoon" },
      }

      whichKey.add(mapping)
    end,
    opts = {},
  },

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
    opts = {
      focus = true,
    },
    cmd = "Trouble",
  },

  {

    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    event = { "BufRead" },
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-tree/nvim-web-devicons",
      "folke/todo-comments.nvim",
    },
    keys = {
      --buffers
      {
        "<leader>tb",
        "<cmd>Telescope buffers show_all_buffers=true<cr>",
        desc = "Search Buffer",
      },
      -- Grep Search
      {
        "<leader>tT",
        ":lua require('telescope.builtin').live_grep()<cr>",
        desc = "Find in current directory",
      },
      {
        "<leader>tt",
        ":lua require('telescope.builtin').live_grep({cwd=vim.fn.systemlist('git rev-parse --show-toplevel')[1]})<cr>",
        desc = "Find in root project",
      },
      {
        "<leader>tsb",
        "<cmd>Telescope current_buffer_fuzzy_find<cr>",
        desc = "Find in current buffer",
      },
      -- Search Files
      {
        "<leader>tfF",
        ":lua require('telescope.builtin').find_files()<cr>",
        desc = "Search file on actual dir",
      },
      {
        "<leader>tff",
        ":lua require('telescope.builtin').find_files({cwd =vim.fn.systemlist('git rev-parse --show-toplevel')[1]})<cr>",
        desc = "Search file on root dir",
      },
      {
        "<leader>tfr",
        "<cmd>Telescope oldfiles<cr>",
        desc = "Search recent file",
      },
      --	-- git
      {
        "<leader>tgcm",
        "<cmd>Telescope git_commits<CR>",
        desc = "Search commits",
      },
      {
        "<leader>tgs",
        "<cmd>Telescope git_status<CR>",
        desc = "Search on modified file",
      },

      --	-- search
      {
        "<leader>tcs",
        "<cmd>Telescope colorscheme<cr>",
        desc = "Colorscheme",
      },
      {
        "<leader>tch",
        "<cmd>Telescope command_history<cr>",
        desc = "Command History",
      },
      {
        "<leader>tcc",
        "<cmd>Telescope commands<cr>",
        desc = "Search commands",
      },
      {
        "<leader>/",
        "<cmd>Telescope current_buffer_fuzzy_find<cr>",
        { desc = "Search in current buffer" },
      },
      -- sessions
      {
        "<leader>tS",
        "<cmd>Telescope persisted<cr>",
        desc = "Search saved sessions",
      },
      -- why not things
      {
        "<leader>tlh",
        "<cmd>HTTPCodes<cr>",
        { desc = "list https codes" },
      },
    },
    opts = {
      defaults = {
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "bottom",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.70,
          height = 0.50,
          preview_cutoff = 120,
        },
        -- file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = {},
        -- generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        path_display = { "truncate" },
        winblend = 0,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        -- file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        -- grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        -- qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        -- Developer configurations: Not meant for general override
        -- buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
        -- mappings = {
        -- n = { ["q"] = require("telescope.actions").close },
        -- },
      },
      pickers = {
        current_buffer_fuzzy_find = {
          previewer = false,
        },
      },
      extensions = {
        ["ui-select"] = {
          -- require("telescope.themes").get_dropdown({
          -- even more opts
          -- }),

          -- pseudo code / specification for writing custom displays, like the one
          -- for "codeactions"
          -- specific_opts = {
          --   [kind] = {
          --     make_indexed = function(items) -> indexed_items, width,
          --     make_displayer = function(widths) -> displayer
          --     make_display = function(displayer) -> function(e)
          --     make_ordinal = function(e) -> string
          --   },
          --   -- for example to disable the custom builtin "codeactions" display
          --      do the following
          --   codeactions = false,
          -- }
        },
        persisted = {
          layout_config = { width = 0.55, height = 0.55 },
        },
        media_files = {
          filetypes = {
            "png",
            "webp",
            "jpg",
            "jpeg",
          },
          find_cmd = "rg", -- find command (defaults to `fd`)
        },
        lazy = {
          -- Optional theme (the extension doesn't set a default theme)
          theme = "ivy",
          -- Whether or not to show the icon in the first column
          show_icon = true,
        },
      },
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local transform_mod = require("telescope.actions.mt").transform_mod

      local trouble = require("trouble")
      local trouble_telescope = require("trouble.sources.telescope")

      -- or create your custom action
      local custom_actions = transform_mod({
        open_trouble_qflist = function(prompt_bufnr)
          trouble.toggle("quickfix")
        end,
      })

      telescope.setup({
        defaults = {
          path_display = { "smart" },
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous, -- move to prev result
              ["<C-j>"] = actions.move_selection_next, -- move to next result
              ["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
              ["<C-t>"] = trouble_telescope.open,
            },
          },
        },
      })

      telescope.load_extension("fzf")
    end,
  },
}

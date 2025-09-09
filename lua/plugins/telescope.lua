return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-ui-select.nvim", -- aqui 👈
  },
  config = function()
    local telescope = require("telescope")

    telescope.setup({
      defaults = {
        layout_config = {
          horizontal = { prompt_position = "top", preview_width = 0.55 },
          vertical = { mirror = false },
        },
        sorting_strategy = "ascending",
        winblend = 0,
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
        ["ui-select"] = require("telescope.themes").get_dropdown({
          winblend = 10,
          previewer = false,
          prompt_title = false,
        }),
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("ui-select")

    -- Atalhos básicos
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep,  { desc = "Live Grep" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers,    { desc = "Find Buffers" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags,  { desc = "Find Help" })
  end,
}


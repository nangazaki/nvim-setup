return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- ícones
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          hide_dotfiles = false, -- mostra arquivos ocultos (opcional)
          hide_gitignored = true,
        },
      },
    })

    -- Atalho para abrir/fechar
    vim.keymap.set("n", "<C-e>", ":Neotree toggle<CR>", { desc = "Toggle Neo-tree" })
  end,
}


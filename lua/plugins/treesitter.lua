return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      -- linguagens que vão ser instaladas
      ensure_installed = {
        -- frontend
        "html", "css", "javascript", "typescript", "tsx", "vue",

        -- backend
        "lua", "json", "go", "python",

        -- extra
        "yaml", "toml", "bash", "dockerfile", "markdown", "markdown_inline",
      },

      sync_install = false, -- instala parsers em paralelo
      auto_install = true,  -- instala automaticamente ao abrir arquivos

      highlight = { enable = true },
      indent = { enable = true },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
    })
  end,
}


return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",       -- LSP
    "hrsh7th/cmp-buffer",         -- buffer atual
    "hrsh7th/cmp-path",           -- paths
    "L3MON4D3/LuaSnip",           -- engine de snippets
    "saadparwaiz1/cmp_luasnip",   -- integração cmp + luasnip
    "rafamadriz/friendly-snippets", -- snippets prontos
    "onsails/lspkind.nvim",       -- ícones
    {
      "Exafunction/codeium.nvim", -- AI
      config = function()
        require("codeium").setup({})
      end,
    },
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
        { name = "codeium" }, -- 🔥 sugestões AI (vem do codeium.nvim)
      }),
      formatting = {
        format = lspkind.cmp_format({
          mode = "symbol_text",
          menu = {
            nvim_lsp = "[LSP]",
            luasnip  = "[Snip]",
            buffer   = "[Buf]",
            path     = "[Path]",
            codeium  = "[AI]",
          },
        }),
      },
    })
  end,
}


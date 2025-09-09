return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",           -- gerenciador de LSP/DAP/Linters/Formatters
    "williamboman/mason-lspconfig.nvim", -- integração mason + lspconfig
    "hrsh7th/cmp-nvim-lsp",              -- capabilities para o cmp
  },
  config = function()
    -- Mason setup
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",              -- Lua
        "ts_ls",               -- JavaScript/TypeScript
        "gopls",               -- Go
        "pyright",             -- Python
        "jsonls",              -- JSON
        "yamlls",              -- YAML
        "html",                -- HTML
        "cssls",               -- CSS
        "dockerls",            -- Docker
      },
    })

    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- função que roda quando o LSP é anexado ao buffer
    local on_attach = function(_, bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }

      -- Keymaps úteis
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)         -- ir para definição
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)               -- documentação
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)     -- implementação
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)     -- renomear símbolo
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)-- code actions
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)         -- referências
      vim.keymap.set("n", "<leader>f", function()
        vim.lsp.buf.format { async = true }
      end, opts) -- formatar
    end

    -- lista de servidores
    local servers = {
      "lua_ls",
      "ts_ls",
      "gopls",
      "pyright",
      "jsonls",
      "yamlls",
      "html",
      "cssls",
      "dockerls",
    }

    -- inicialização dos servidores
    for _, server in ipairs(servers) do
      local opts = { 
        on_attach = on_attach,
        capabalities = capabalities,
      }

      if server == "lua_ls" then
        opts.settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            diagnostics = {
              globals = { "vim" }, -- evita erro "vim unknown"
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        }
      end

      lspconfig[server].setup(opts)
    end
  end,
}


return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
  },
  config = function()
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })

    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "bashls",
        "clangd",
        "cssls",
        "html",
        "jdtls",
        "jsonls",
        "lua_ls",
        "pyright",
        "taplo",
        "ts_ls",
        "yamlls",
      },
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(ev)
        local opts = { buffer = ev.buf }

        opts.desc = "LSP: Jump to definition"
        vim.keymap.set("n", "gd", function()
          vim.lsp.buf.definition()
        end, opts)

        opts.desc = "LSP: Show documentation"
        vim.keymap.set("n", "K", function()
          vim.lsp.buf.hover()
        end, opts)

        opts.desc = "LSP: Jump to implementation"
        vim.keymap.set("n", "gi", function()
          vim.lsp.buf.implementation()
        end, opts)

        -- opts.desc = "LSP: Code action"
        -- vim.keymap.set("n", "<leader>ca", function()
        --     vim.lsp.buf.code_action()
        -- end, opts)

        opts.desc = "LSP: Rename symbol"
        vim.keymap.set("n", "<leader>rn", function()
          vim.lsp.buf.rename()
        end, opts)

        opts.desc = "LSP: Signature help"
        vim.keymap.set("i", "<C-h>", function()
          vim.lsp.buf.signature_help()
        end, opts)

        opts.desc = "LSP: Previous diagnostic"
        vim.keymap.set("n", "[d", function()
          vim.diagnostic.goto_prev()
        end, opts)

        opts.desc = "LSP: Next diagnostic"
        vim.keymap.set("n", "]d", function()
          vim.diagnostic.goto_next()
        end, opts)
      end,
    })
  end,
}

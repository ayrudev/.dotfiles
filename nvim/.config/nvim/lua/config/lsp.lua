local M = {}

local function setup_diagnostics()
  local signs = {
    Error = " ",
    Warn = " ",
    Hint = "󰌵 ",
    Info = " ",
  }

  for severity, icon in pairs(signs) do
    local name = "DiagnosticSign" .. severity
    vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
  end

  vim.diagnostic.config({
    signs = true,
    underline = true,
    severity_sort = true,
    update_in_insert = false,
    virtual_text = {
      source = "if_many",
      spacing = 2,
    },
    float = {
      border = "rounded",
      source = "if_many",
    },
  })
end

local function lsp_keymap(mode, lhs, rhs, bufnr, desc)
  vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
end

function M.on_attach(client, bufnr)
  vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

  lsp_keymap("n", "gd", vim.lsp.buf.definition, bufnr, "LSP: Go to definition")
  lsp_keymap("n", "K", vim.lsp.buf.hover, bufnr, "LSP: Hover")
  lsp_keymap("n", "gr", vim.lsp.buf.references, bufnr, "LSP: References")
  lsp_keymap("n", "<leader>rn", vim.lsp.buf.rename, bufnr, "LSP: Rename")
  lsp_keymap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, bufnr, "LSP: Code action")
  lsp_keymap("n", "<leader>f", function()
    vim.lsp.buf.format({ async = true })
  end, bufnr, "LSP: Format")
  lsp_keymap("n", "[d", vim.diagnostic.goto_prev, bufnr, "LSP: Previous diagnostic")
  lsp_keymap("n", "]d", vim.diagnostic.goto_next, bufnr, "LSP: Next diagnostic")
  lsp_keymap("n", "<leader>d", vim.diagnostic.open_float, bufnr, "LSP: Show diagnostics")

  if client.supports_method("textDocument/implementation") then
    lsp_keymap("n", "gi", vim.lsp.buf.implementation, bufnr, "LSP: Go to implementation")
  end
end

local function build_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if has_cmp then
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
  end
  return capabilities
end

local function default_servers()
  local servers = {
    tsserver = {},
    gopls = {},
    pyright = {},
    lua_ls = {
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
          },
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            checkThirdParty = false,
            library = vim.api.nvim_get_runtime_file("", true),
          },
          telemetry = {
            enable = false,
          },
        },
      },
    },
  }

  return servers
end

function M.setup()
  local has_lspconfig, lspconfig = pcall(require, "lspconfig")
  if not has_lspconfig then
    return
  end

  setup_diagnostics()

  local capabilities = build_capabilities()
  local servers = default_servers()

  if not lspconfig.tsserver and lspconfig.ts_ls and servers.tsserver then
    servers.ts_ls = servers.tsserver
    servers.tsserver = nil
  end

  local has_mason, mason = pcall(require, "mason")
  if has_mason then
    mason.setup()
  end

  local has_mason_lspconfig, mason_lspconfig = pcall(require, "mason-lspconfig")
  if has_mason_lspconfig then
    mason_lspconfig.setup({
      automatic_installation = true,
    })
  end

  for server, server_opts in pairs(servers) do
    if lspconfig[server] then
      lspconfig[server].setup(vim.tbl_deep_extend("force", {
        on_attach = M.on_attach,
        capabilities = capabilities,
      }, server_opts))
    end
  end
end

return M

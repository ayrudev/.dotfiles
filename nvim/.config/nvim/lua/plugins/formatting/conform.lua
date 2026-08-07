return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff_format" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        json = { "prettier" },
        java = { "google-java-format" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        bash = { "shfmt" },
        zsh = { "shfmt" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        toml = { "taplo" },
      },
      formatters = {
        stylua = {
          prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" },
        },
        shfmt = {
          prepend_args = { "-i", "2", "-ci" },
        },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "mason-org/mason.nvim", "mason-org/mason-lspconfig.nvim" },
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          -- Formatters
          "stylua",
          "ruff",
          "prettier",
          "shfmt",
          "clang-format",
          "taplo",
          "google-java-format",
        },
        auto_update = false,
        run_on_start = true,
      })
    end,
  },
}

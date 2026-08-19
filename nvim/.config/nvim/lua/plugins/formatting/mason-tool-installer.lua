return {
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

        -- Linters
        "eslint_d",
      },
      auto_update = false,
      run_on_start = true,
    })
  end,
}

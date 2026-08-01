return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      python = { "ruff" },
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      bash = { "shellcheck" },
      zsh = { "shellcheck" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("nvim-lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })
    require("mason-tool-installer").setup({
      ensure_installed = {
        -- Linters
        "ruff",
        "eslint_d",
        "shellcheck",
      },
      auto_update = false,
      run_on_start = true,
    })
  end,
}

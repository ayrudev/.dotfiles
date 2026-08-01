return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter")
    local languages = {
      "bash",
      "c",
      "cpp",
      "css",
      "dockerfile",
      "gitcommit",
      "gitignore",
      "git_config",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "regex",
      "scss",
      "toml",
      "vim",
      "vimdoc",
      "yaml",
      "zsh",
    }

    ts.setup({})
    ts.install(languages)

    vim.api.nvim_create_autocmd("FileType", {
      pattern = languages,
      callback = function()
        -- Turn on native Neovim treesitter highlighting
        vim.treesitter.start()

        -- Turn on treesitter-based indentation
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}

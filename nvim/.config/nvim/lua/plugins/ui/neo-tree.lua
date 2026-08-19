return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false,
  config = function()
    vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
    vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
    vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
    vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })

    require("neo-tree").setup({
      close_if_last_window = true, -- Close Neovim if neo-tree is the last window left
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,

      default_component_configs = {
        git_status = {
          symbols = {
            added = "✚",
            modified = "",
            deleted = "✖",
            renamed = "󰁕",
            untracked = "",
            ignored = "",
            unstaged = "󰄱",
            staged = "",
            conflict = "",
          },
        },
      },

      filesystem = {
        filtered_items = {
          visible = false,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        follow_current_file = {
          enabled = true, -- Automatically find and focus the active buffer in the tree
        },
        use_libuv_file_watcher = true, -- Automatically update the tree when files change on disk
      },
      window = {
        position = "left",
        width = 35,
        mappings = {
          -- Standard navigation
          ["<space>"] = "none", -- Disable space so it doesn't trigger default actions
          ["<cr>"] = "open",
          ["l"] = "open", -- Open directory or file using 'l'
          ["h"] = "close_node", -- Close directory using 'h'
          -- Splitting
          ["s"] = "open_split", -- Open file in horizontal split
          ["v"] = "open_vsplit", -- Open file in vertical split
          -- File Operations
          ["a"] = {
            "add",
            -- Supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc)
            config = { show_path = "none" },
          },
          ["A"] = "add_directory",
          ["d"] = "delete",
          ["r"] = "rename",
          ["y"] = "copy_to_clipboard",
          ["x"] = "cut_to_clipboard",
          ["p"] = "paste_from_clipboard",
          ["c"] = "copy", -- Prompts for a destination path
          ["m"] = "move", -- Prompts for a destination path
          -- Utilities
          ["q"] = "close_window",
          ["R"] = "refresh",
          ["?"] = "show_help",
        },
      },
    })
    -- Global keymaps to easily toggle and focus the tree
    vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle Neo-tree", silent = true })
    vim.keymap.set("n", "<leader>o", ":Neotree focus<CR>", { desc = "Focus Neo-tree", silent = true })
  end,
}

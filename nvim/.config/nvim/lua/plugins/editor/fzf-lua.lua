return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local fzf = require("fzf-lua")
    fzf.setup({})

    vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "Find Files" })
    vim.keymap.set("n", "<leader>fg", fzf.live_grep, { desc = "Live Grep (Search text)" })
    vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "Find Buffers (Open files)" })
    vim.keymap.set("n", "<leader>fh", fzf.helptags, { desc = "Find Help" })
  end,
}

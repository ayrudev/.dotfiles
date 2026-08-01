return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  keys = {
    { "<leader>gd", "<cmd>DiffviewOpen<CR>", desc = "Open Diffview" },
    { "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", desc = "File Git History" },
  },
  opts = {},
}

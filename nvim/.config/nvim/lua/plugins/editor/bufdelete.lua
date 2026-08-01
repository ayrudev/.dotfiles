return {
  "famiu/bufdelete.nvim",
  config = function()
    -- Map <leader>bd to safely delete the buffer without closing windows/neo-tree
    vim.keymap.set("n", "<leader>bd", "<Cmd>Bdelete<CR>", { desc = "Delete buffer safely" })
  end,
}

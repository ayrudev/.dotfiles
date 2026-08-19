return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    -- Automatically picks up TODO, FIXME, HACK, etc.
  },
  config = function()
    require("todo-comments").setup()
    vim.keymap.set("n", "<leader>ft", "<cmd>TodoFzfLua<CR>", { desc = "Find TODOs" })
  end,
}

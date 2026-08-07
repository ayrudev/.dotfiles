return {
  "fedepujol/move.nvim",
  opts = {},
  keys = {
    -- Normal mode
    { "<A-j>", ":MoveLine(1)<CR>", mode = "n", silent = true, desc = "Move line down" },
    { "<A-k>", ":MoveLine(-1)<CR>", mode = "n", silent = true, desc = "Move line up" },
    { "<A-h>", ":MoveWord(-1)<CR>", mode = "n", silent = true, desc = "Move word left" },
    { "<A-l>", ":MoveWord(1)<CR>", mode = "n", silent = true, desc = "Move word right" },

    -- Visual mode
    { "<A-j>", ":MoveBlock(1)<CR>", mode = "v", silent = true, desc = "Move block down" },
    { "<A-k>", ":MoveBlock(-1)<CR>", mode = "v", silent = true, desc = "Move block up" },
    { "<A-h>", ":MoveHBlock(-1)<CR>", mode = "v", silent = true, desc = "Move block left" },
    { "<A-l>", ":MoveHBlock(1)<CR>", mode = "v", silent = true, desc = "Move block right" },
  },
}

return {
  "echasnovski/mini.move",
  version = false,
  config = function()
    require("mini.move").setup({
      -- Module mappings. Use empty string '' to disable default behavior
      mappings = {
        -- Visual mode shifting
        left = "<M-h>",
        right = "<M-l>",
        down = "J",
        up = "K",

        -- Normal mode shifting (optional bonus)
        line_left = "<M-h>",
        line_right = "<M-l>",
        line_down = "<M-j>",
        line_up = "<M-k>",
      },
    })
  end,
}

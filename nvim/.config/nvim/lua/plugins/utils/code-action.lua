return {
  "rachartier/tiny-code-action.nvim",
  dependencies = {
    { "nvim-telescope/telescope.nvim" },
  },
  event = "LspAttach",
  opts = {
    picker = "telescope",
  },
  keys = {
    {
      "<leader>ca",
      function()
        require("tiny-code-action").code_action()
      end,
      mode = { "n", "x" },
      desc = "LSP Code Actions",
    },
  },
}

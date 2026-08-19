return {
  "rachartier/tiny-code-action.nvim",
  dependencies = {
    { "ibhagwan/fzf-lua" },
  },
  event = "LspAttach",
  opts = {
    picker = "fzf-lua",
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

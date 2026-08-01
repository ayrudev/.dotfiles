return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "helix",
    spec = {
      { "<leader>b", group = "[B]uffer" },
      { "<leader>c", group = "[C]ode" },
      { "<leader>f", group = "[F]iles" },
      { "<leader>s", group = "[S]earch & Replace" },
      { "<leader>g", group = "[G]it" },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = true })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}

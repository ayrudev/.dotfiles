return {
  "MagicDuck/grug-far.nvim",
  cmd = "GrugFar",
  keys = {
    {
      "<leader>sr",
      function()
        require("grug-far").open({ transient = true })
      end,
      mode = { "n", "v" },
      desc = "Search and Replace (grug-far)",
    },
  },
  opts = {},
}

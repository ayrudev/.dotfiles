return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "theHamsta/nvim-dap-virtual-text", -- Shows variable values as virtual text while debugging
  },
  keys = {
    {
      "<leader>db",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "Toggle Breakpoint",
    },
    {
      "<leader>dB",
      function()
        require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end,
      desc = "Conditional Breakpoint",
    },
    {
      "<leader>dc",
      function()
        require("dap").continue()
      end,
      desc = "Continue / Start Debugging",
    },
    {
      "<leader>di",
      function()
        require("dap").step_into()
      end,
      desc = "Step Into",
    },
    {
      "<leader>do",
      function()
        require("dap").step_over()
      end,
      desc = "Step Over",
    },
    {
      "<leader>dO",
      function()
        require("dap").step_out()
      end,
      desc = "Step Out",
    },
    {
      "<leader>dr",
      function()
        require("dap").repl.toggle()
      end,
      desc = "Toggle REPL",
    },
    {
      "<leader>dl",
      function()
        require("dap").run_last()
      end,
      desc = "Run Last",
    },
    {
      "<leader>dt",
      function()
        require("dap").terminate()
      end,
      desc = "Terminate Debugging",
    },
  },
  config = function()
    require("nvim-dap-virtual-text").setup()

    -- Called directly rather than via a FileType autocmd: nvim-dap itself is
    -- lazy-loaded on keypress (see `keys` above), which happens well after
    -- the buffer's FileType event already fired. An autocmd registered here
    -- would miss that event and never run. This setup is just cheap table
    -- assignment, not real plugin loading, so there's nothing to gain by
    -- deferring it further.
    require("config.dap-cpp").setup()
  end,
}

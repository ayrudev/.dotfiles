return {
  "mfussenegger/nvim-dap-python",
  ft = "python",
  dependencies = { "mfussenegger/nvim-dap" },
  config = function()
    -- Point at the debugpy install that mason-tool-installer already manages
    local mason_registry = require("mason-registry")
    local debugpy_path = mason_registry.get_package("debugpy"):get_install_path() .. "/venv/bin/python"
    require("dap-python").setup(debugpy_path)
  end,
}

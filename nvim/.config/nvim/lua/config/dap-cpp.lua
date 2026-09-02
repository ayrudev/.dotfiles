-- C/C++ debug adapter (codelldb), wired up by dap.lua on FileType c/cpp.
local M = {}

function M.setup()
  local dap = require("dap")
  local mason_registry = require("mason-registry")
  local codelldb_path = mason_registry.get_package("codelldb"):get_install_path() .. "/extension/adapter/codelldb"

  dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
      command = codelldb_path,
      args = { "--port", "${port}" },
    },
  }

  local cpp_config = {
    {
      name = "Launch file",
      type = "codelldb",
      request = "launch",
      program = function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
    },
  }

  dap.configurations.cpp = cpp_config
  dap.configurations.c = cpp_config
end

return M

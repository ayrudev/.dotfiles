return {
  "mfussenegger/nvim-jdtls",
  ft = "java",

  dependencies = {
    "mason-org/mason.nvim",
  },

  config = function()
    local jdtls = require("jdtls")

    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
    local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. project_name

    local root_markers = {
      ".git",
      "mvnw",
      "gradlew",
      "pom.xml",
      "build.gradle",
      "build.gradle.kts",
    }

    local root_dir = require("jdtls.setup").find_root(root_markers)

    if root_dir == "" then
      return
    end

    jdtls.start_or_attach({
      cmd = {
        "jdtls",
        "-data",
        workspace_dir,
      },

      root_dir = root_dir,

      settings = {
        java = {
          signatureHelp = {
            enabled = true,
          },
          contentProvider = {
            preferred = "fernflower",
          },
        },
      },

      init_options = {
        bundles = {},
      },
    })
  end,
}

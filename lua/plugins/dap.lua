return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui", -- pretty UI
    "williamboman/mason.nvim", -- to install debug adapters
    "jay-babu/mason-nvim-dap.nvim", -- integrates dap + mason
  },
  config = function()
    local dap = require "dap"
    local dapui = require "dapui"

    require("mason-nvim-dap").setup {
      automatic_setup = true,
      handlers = {},
      ensure_installed = { "node2", "python" }, -- common debuggers
    }

    dapui.setup()

    -- Auto open/close dap-ui
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
  end,
}

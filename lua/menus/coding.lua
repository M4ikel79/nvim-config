-- Development-focused menu
return {
  {
    name = "  Format Buffer",
    cmd = function()
      require("conform").format { lsp_fallback = true }
    end,
    rtxt = "<leader>cf",
  },

  {
    name = "  Code Actions",
    cmd = vim.lsp.buf.code_action,
    rtxt = "<leader>ca",
  },

  {
    name = "  Rename Symbol",
    cmd = vim.lsp.buf.rename,
    rtxt = "<leader>cr",
  },

  { name = "separator" },

  {
    name = "  Debug Actions",
    hl = "ExRed",
    items = {
      {
        name = "Toggle Breakpoint",
        cmd = function()
          require("dap").toggle_breakpoint()
        end,
        rtxt = "<leader>db",
      },
      {
        name = "Continue Debug",
        cmd = function()
          require("dap").continue()
        end,
        rtxt = "<leader>dc",
      },
      {
        name = "Step Into",
        cmd = function()
          require("dap").step_into()
        end,
        rtxt = "<leader>di",
      },
      {
        name = "Step Over",
        cmd = function()
          require("dap").step_over()
        end,
        rtxt = "<leader>dO",
      },
      {
        name = "Toggle Debug UI",
        cmd = function()
          require("dapui").toggle {}
        end,
        rtxt = "<leader>du",
      },
    },
  },

  { name = "separator" },

  {
    name = "  Live Server",
    hl = "ExGreen",
    items = {
      {
        name = "Start Live Server",
        cmd = "LiveServerStart",
        rtxt = "<leader>ls",
      },
      {
        name = "Stop Live Server",
        cmd = "LiveServerStop",
        rtxt = "<leader>lx",
      },
    },
  },

  { name = "separator" },

  {
    name = "  Diagnostics",
    cmd = "Trouble diagnostics toggle",
    rtxt = "<leader>xx",
  },

  {
    name = "  References",
    cmd = "Trouble lsp toggle focus=false win.position=right",
    rtxt = "gR",
  },
}

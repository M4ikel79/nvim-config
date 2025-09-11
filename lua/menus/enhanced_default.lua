-- Enhanced version of your default menu
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

  { name = "separator" },

  {
    name = "  Development",
    hl = "ExBlue",
    items = "coding",
  },

  {
    name = "  File Operations",
    hl = "ExGreen",
    items = "files",
  },

  {
    name = "  UI & Appearance",
    hl = "ExYellow",
    items = "ui",
  },

  {
    name = "  Terminal & Tools",
    hl = "ExRed",
    items = "terminal",
  },

  { name = "separator" },

  {
    name = "  Git Actions",
    hl = "ExCyan",
    items = "gitsigns",
  },

  { name = "separator" },

  {
    name = "  Quick Actions",
    items = {
      {
        name = "Edit Config",
        cmd = function()
          vim.cmd "tabnew"
          local conf = vim.fn.stdpath "config"
          vim.cmd("tcd " .. conf .. " | e init.lua")
        end,
        rtxt = "ed",
      },
      {
        name = "Copy Content",
        cmd = "%y+",
        rtxt = "<C-c>",
      },
      {
        name = "Delete Content",
        cmd = "%d",
        rtxt = "dc",
      },
      {
        name = "Cheatsheet",
        cmd = "NvCheatsheet",
        rtxt = "<leader>ch",
      },
    },
  },
}

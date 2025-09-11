-- UI and appearance menu
return {
  {
    name = "  Theme Picker",
    cmd = function()
      require("nvchad.themes").open()
    end,
    rtxt = "<leader>ut",
  },

  {
    name = "  Toggle Transparency",
    cmd = function()
      vim.g.transparency = not vim.g.transparency
      require("base46").toggle_transparency()
    end,
    rtxt = "<leader>ui",
  },

  { name = "separator" },

  {
    name = "  Line Numbers",
    items = {
      {
        name = "Toggle Line Numbers",
        cmd = function()
          vim.opt_local.number = not vim.opt_local.number:get()
        end,
        rtxt = "<leader>ul",
      },
      {
        name = "Toggle Relative Numbers",
        cmd = function()
          vim.opt_local.relativenumber = not vim.opt_local.relativenumber:get()
        end,
        rtxt = "<leader>ur",
      },
    },
  },

  {
    name = "  Toggle Word Wrap",
    cmd = function()
      vim.opt_local.wrap = not vim.opt_local.wrap:get()
    end,
    rtxt = "<leader>uw",
  },

  { name = "separator" },

  {
    name = "  Show Keys",
    cmd = "ShowkeysToggle",
    rtxt = "<leader>uk",
  },

  {
    name = "  Dismiss Notifications",
    cmd = "NoiceDismiss",
    rtxt = "<leader>nd",
  },

  {
    name = "  Notification History",
    cmd = "NoiceHistory",
    rtxt = "<leader>nh",
  },

  { name = "separator" },

  {
    name = "  Color Picker",
    cmd = function()
      require("minty.huefy").open()
    end,
  },
}

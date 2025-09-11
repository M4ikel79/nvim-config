-- Terminal and workflow menu
return {
  {
    name = "  Float Terminal",
    cmd = function()
      require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
    end,
    rtxt = "<A-i>",
  },

  {
    name = "  Horizontal Terminal",
    cmd = function()
      require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
    end,
    rtxt = "<A-h>",
  },

  {
    name = "  Vertical Terminal",
    cmd = function()
      require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
    end,
    rtxt = "<A-v>",
  },

  { name = "separator" },

  {
    name = "  LazyGit",
    cmd = "LazyGit",
    rtxt = "<leader>lg",
  },

  {
    name = "  LazyGit Current File",
    cmd = "LazyGitCurrentFile",
    rtxt = "<leader>lf",
  },

  { name = "separator" },

  {
    name = "  Mason",
    cmd = "Mason",
    rtxt = "<leader>cm",
  },

  {
    name = "  Lazy",
    cmd = "Lazy",
    rtxt = "<leader>l",
  },

  { name = "separator" },

  {
    name = "  Practice Typing",
    items = {
      {
        name = "Start Typr",
        cmd = "Typr",
        rtxt = "<leader>ty",
      },
      {
        name = "Typr Stats",
        cmd = "TyprStats",
        rtxt = "<leader>ts",
      },
    },
  },
}

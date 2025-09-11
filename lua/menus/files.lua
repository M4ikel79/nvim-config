-- File operations menu
return {
  {
    name = "  New File",
    cmd = "enew",
    rtxt = "<leader>fn",
  },

  {
    name = "  Find Files",
    cmd = "Telescope find_files",
    rtxt = "<leader>ff",
  },

  {
    name = "  Recent Files",
    cmd = "Telescope oldfiles",
    rtxt = "<leader>fr",
  },

  {
    name = "  Find in Files",
    cmd = "Telescope live_grep",
    rtxt = "<leader>sg",
  },

  { name = "separator" },

  {
    name = "  File Explorer",
    cmd = "NvimTreeToggle",
    rtxt = "<leader>e",
  },

  {
    name = "  Config Files",
    cmd = "Telescope find_files cwd=~/.config/nvim",
    rtxt = "<leader>fc",
  },

  { name = "separator" },

  {
    name = "  Buffer Actions",
    items = {
      {
        name = "Switch Buffer",
        cmd = "e #",
        rtxt = "<leader>bb",
      },
      {
        name = "Delete Buffer",
        cmd = function()
          require("nvchad.tabufline").close_buffer()
        end,
        rtxt = "<leader>bd",
      },
      {
        name = "List Buffers",
        cmd = "Telescope buffers",
        rtxt = "<leader>fb",
      },
    },
  },
}

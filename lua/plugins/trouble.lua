return {
  "folke/trouble.nvim",
  version = "v1.*", -- force v1 API
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = "Trouble",
  opts = {
    position = "bottom",
    height = 10,
    width = 50,
    icons = true,
    mode = "document_diagnostics",
    fold_open = "",
    fold_closed = "",
    group = true,
    padding = true,
    action_keys = {
      close = "q",
      cancel = "<esc>",
      refresh = "r",
      jump = { "<cr>", "<tab>" },
    },
  },
}

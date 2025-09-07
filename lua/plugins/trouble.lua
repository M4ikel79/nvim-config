return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = "Trouble",
  opts = {
    position = "bottom", -- bottom, top, left, right
    height = 10,
    width = 50,
    icons = true,
    mode = "document_diagnostics", -- "workspace_diagnostics", "lsp_references", "loclist", "quickfix"
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

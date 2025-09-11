-- Markdown-specific menu (for .md files)
return {
  {
    name = "  Toggle Render",
    cmd = function()
      -- Toggle render-markdown plugin if loaded
      local ok, render = pcall(require, "render-markdown")
      if ok then
        render.toggle()
      else
        vim.notify "Render markdown plugin not loaded"
      end
    end,
  },

  { name = "separator" },

  {
    name = "  Insert Table",
    cmd = function()
      local lines = {
        "| Header 1 | Header 2 | Header 3 |",
        "|----------|----------|----------|",
        "| Cell 1   | Cell 2   | Cell 3   |",
      }
      vim.api.nvim_put(lines, "l", true, true)
    end,
  },

  {
    name = "  Insert Code Block",
    cmd = function()
      local lines = { "```lua", "", "```" }
      vim.api.nvim_put(lines, "l", true, true)
      vim.api.nvim_win_set_cursor(0, { vim.fn.line "." - 1, 0 })
    end,
  },

  { name = "separator" },

  {
    name = "  Common Actions",
    items = "default",
  },
}

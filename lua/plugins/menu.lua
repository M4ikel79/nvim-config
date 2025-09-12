-- lua/plugins/menu.lua - Menu plugin configuration
return {
  "nvzone/menu",
  dependencies = { "nvzone/volt" },
  keys = {
    {
      "<C-t>",
      function()
        require("menu").open "enhanced_default"
      end,
      desc = "Open Context Menu",
    },
    {
      "<leader>dm",
      function()
        require("menu").open "coding"
      end,
      desc = "Development Menu",
    },
    {
      "<leader>mm",
      function()
        require("menu").open "files"
      end,
      desc = "File Menu",
    },
    {
      "<leader>um",
      function()
        require("menu").open "ui"
      end,
      desc = "UI Menu",
    },
    {
      "<leader>tm",
      function()
        require("menu").open "terminal"
      end,
      desc = "Terminal Menu",
    },
  },
  config = function()
    local map = vim.keymap.set

    -- Smart right-click context menu
    map({ "n", "v" }, "<RightMouse>", function()
      require("menu.utils").delete_old_menus()
      vim.cmd.exec '"normal! \\<RightMouse>"'

      local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid)
      local filetype = vim.bo[buf].ft
      local options

      -- Context-aware menu selection
      if filetype == "NvimTree" then
        options = "nvimtree"
      elseif filetype == "markdown" then
        options = "markdown"
      elseif vim.tbl_contains({ "lua", "python", "javascript", "typescript", "rust", "go", "c", "cpp" }, filetype) then
        options = "coding"
      else
        options = "enhanced_default"
      end

      require("menu").open(options, { mouse = true })
    end, { desc = "Context Menu" })
  end,
}

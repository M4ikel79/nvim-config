return {
  "karb94/neoscroll.nvim",
  event = "WinScrolled",
  config = function()
    require("neoscroll").setup({
      -- You can tweak easing and speed here
      easing_function = "quadratic", -- default is 'cubic'
    })
  end,
}

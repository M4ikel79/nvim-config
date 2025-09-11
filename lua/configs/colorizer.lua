return {
  "NvChad/nvim-colorizer.lua",
  opts = {
    filetypes = { "css", "scss", "html", "javascript", "typescript", "lua" },
    user_default_options = {
      RGB = true, -- rgb(255,255,255)
      RRGGBB = true, -- #RRGGBB
      names = true, -- "Blue" or "blue"
      RRGGBBAA = true, -- #RRGGBBAA
      rgb_fn = true, -- CSS rgb() and rgba()
      hsl_fn = true, -- CSS hsl() and hsla()
      css = true, -- Enable all CSS features
      css_fn = true, -- Enable all CSS functions
    },
  },
}

return {
  "saghen/blink.cmp",
  opts = {
    sources = {
      default = { "lsp", "snippets", "buffer", "path" },
    },
  },
  dependencies = {
    {
      "neovim/nvim-lspconfig",
      config = function()
        local lspconfig = require "lspconfig"

        -- Setup emmet-ls (make sure it's installed: npm install -g emmet-ls)
        lspconfig.emmet_ls.setup {
          filetypes = {
            "html",
            "css",
            "javascriptreact",
            "typescriptreact",
            "javascript",
            "typescript",
            "svelte",
            "vue",
            "php",
            "markdown",
          },
          init_options = {
            html = {
              options = {
                ["bem.enabled"] = true,
              },
            },
          },
        }
      end,
    },
  },
}

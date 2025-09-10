require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
-- nushell integration
require("lspconfig").nushell.setup {
  cmd = { "nu", "--lsp" },
  filetypes = { "nu" },
  root_dir = require("lspconfig").util.find_git_ancestor,
  single_file_support = true,
}

vim.filetype.add {
  extension = {
    nu = "nu",
  },
}
-- servers
local servers = {
  "black",
  "css-lsp",
  "emmet-ls",
  "eslint-lsp",
  "eslint_d",
  "html-lsp",
  "prettierd",
  "pylint",
  "pyright",
  "uv",
}

for _, server in ipairs(servers) do
  lspconfig[server].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

require("nvchad.configs.lspconfig").defaults()

local servers = {
  "emmet-ls",
  "html-lsp",
  "css-lsp",
  "black",
  "eslint-lsp",
  "eslint_d",
}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
-- nushell integration
require("lspconfig").nushell.setup {
  cmd = { "nu", "--lsp" },
  filetypes = { "nu" },
  root_dir = function(fname)
    return vim.fs.dirname(vim.fs.find(".git", { path = fname, upward = true })[1])
  end,
  single_file_support = true,
}

vim.filetype.add {
  extension = {
    nu = "nu",
  },
}
-- servers
-- local servers = {
--   "black",
--   "css-lsp",
--   "emmet-ls",
--   "eslint-lsp",
--   "eslint_d",
--   "html-lsp",
--   "prettierd",
--   "pylint",
--   "pyright",
--   "uv",
-- }

-- for _, server in ipairs(servers) do
--   lspconfig[server].setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--   }
-- end

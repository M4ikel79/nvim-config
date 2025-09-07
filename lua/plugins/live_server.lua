return {
  "barrett-ruth/live-server.nvim",
  build = "sudo npm install -g live-server", -- requires Node
  cmd = { "LiveServerStart", "LiveServerStop" },
  config = true,
}

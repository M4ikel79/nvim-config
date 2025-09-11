-- Leader key setup FIRST (must be before plugins/mappings)
--
-- Now safe to load NvChad mappings
require "nvchad.mappings"

local map = vim.keymap.set

-- Set CapsLock as Leader
vim.keymap.set("n", "<CapsLock>", "<leader>", { remap = true })

-- ================================
-- BASIC NAVIGATION & EDITING
-- ================================

-- Better up/down (handles wrapped lines)
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = "Down" })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = "Up" })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- FIXED: Use Alt+Arrow for window resize to avoid vim-visual-multi conflicts
map("n", "<A-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<A-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<A-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<A-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- REMOVED: Alt+j/k move mappings (letting mini.move handle this with Alt+hjkl)
-- mini.move will use: <A-h> <A-j> <A-k> <A-l> for moving lines/selections

-- ================================
-- ENHANCED EDITING
-- ================================

-- Command mode with semicolon
map("n", ";", ":", { desc = "CMD enter command mode" })

-- Better escape sequences
map("i", "jk", "<ESC>", { desc = "Escape insert mode" })
map("i", "kj", "<ESC>", { desc = "Escape insert mode" })

-- Save file
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

-- Better indenting
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- Paste without yanking in visual mode
map("x", "p", [["_dP]], { desc = "Paste without yanking" })

-- Select all
map("v", "<C-a>", "ggVG", { desc = "Select all" })

-- Copy entire file
map("v", "<C-c>", "<cmd>%y+<CR>", { desc = "Copy whole file" })

-- Better search centering
map("n", "n", "nzzzv", { desc = "Next Search Result" })
map("n", "N", "Nzzzv", { desc = "Prev Search Result" })

-- Join lines and keep cursor position
map("n", "J", "mzJ`z", { desc = "Join Lines" })

-- Center screen on page movements
map("n", "<C-d>", "<C-d>zz", { desc = "Half Page Down" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half Page Up" })

-- Navigate through jumplist with centering
map("n", "<C-o>", "<C-o>zz", { desc = "Jump Back" })
map("n", "<C-i>", "<C-i>zz", { desc = "Jump Forward" })

-- ================================
-- PLUGIN MAPPINGS
-- ================================

-- Flash.nvim (jumping/navigation)
map({ "n", "x", "o" }, "s", function()
  require("flash").jump()
end, { desc = "Flash Jump" })
map({ "n", "x", "o" }, "S", function()
  require("flash").treesitter()
end, { desc = "Flash Treesitter" })
map("o", "r", function()
  require("flash").remote()
end, { desc = "Remote Flash" })
map({ "o", "x" }, "R", function()
  require("flash").treesitter_search()
end, { desc = "Flash Treesitter Search" })
map("c", "<c-s>", function()
  require("flash").toggle()
end, { desc = "Toggle Flash Search" })

-- Commenting (Comment.nvim via NvChad)
map("n", "<leader>/", "gcc", { desc = "Toggle Comment", remap = true })
map("v", "<leader>/", "gc", { desc = "Toggle comment", remap = true })

-- ================================
-- BUFFER MANAGEMENT
-- ================================

-- Buffer navigation
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- Buffer management
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>bd", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "Delete Buffer" })
map("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

-- New buffer
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- ================================
-- WINDOW MANAGEMENT
-- ================================

-- Split management
map("n", "<leader>ww", "<C-W>p", { desc = "Other Window", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })
map("n", "<leader>w-", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>w|", "<C-W>v", { desc = "Split Window Right", remap = true })
map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })

-- Tab management
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- ================================
-- SEARCH AND TELESCOPE
-- ================================

-- Find files
map("n", "<leader><space>", "<cmd>Telescope find_files<cr>", { desc = "Find Files (Root Dir)" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files (Root Dir)" })
map(
  "n",
  "<leader>fF",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<cr>",
  { desc = "Find Files (cwd)" }
)
map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Recent" })
map("n", "<leader>fR", "<cmd>Telescope oldfiles cwd_only=true<cr>", { desc = "Recent (cwd)" })

-- Git files
map("n", "<leader>fg", "<cmd>Telescope git_files<cr>", { desc = "Find Files (git-files)" })

-- Search
map("n", "<leader>sg", "<cmd>Telescope live_grep<cr>", { desc = "Grep (Root Dir)" })
map("n", "<leader>sG", "<cmd>Telescope live_grep cwd=false<cr>", { desc = "Grep (cwd)" })
map("n", "<leader>sw", "<cmd>Telescope grep_string word_match=-w<cr>", { desc = "Word (Root Dir)" })
map("n", "<leader>sW", "<cmd>Telescope grep_string cwd=false word_match=-w<cr>", { desc = "Word (cwd)" })
map("v", "<leader>sw", "<cmd>Telescope grep_string<cr>", { desc = "Selection (Root Dir)" })
map("v", "<leader>sW", "<cmd>Telescope grep_string cwd=false<cr>", { desc = "Selection (cwd)" })

-- Search config files
map("n", "<leader>fc", "<cmd>Telescope find_files cwd=~/.config/nvim<cr>", { desc = "Find Config File" })

-- Buffer search
map("n", "<leader>fb", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", { desc = "Buffers" })
map("n", "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Buffer" })

-- Telescope utilities
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help Pages" })
map("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "Key Maps" })
map("n", "<leader>fM", "<cmd>Telescope man_pages<cr>", { desc = "Man Pages" })
map("n", "<leader>fm", "<cmd>Telescope marks<cr>", { desc = "Jump to Mark" })
map("n", "<leader>fo", "<cmd>Telescope vim_options<cr>", { desc = "Options" })
map("n", "<leader>fT", "<cmd>Telescope builtin<cr>", { desc = "Telescope" })

-- ================================
-- FILE EXPLORER
-- ================================

-- FIXED: Changed <C-n> to <C-e> to avoid vim-visual-multi conflict
map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Explorer NvimTree (Root Dir)" })
map("n", "<leader>E", "<cmd>NvimTreeFocus<cr>", { desc = "Explorer NvimTree (cwd)" })
map("n", "<C-e>", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle nvim-tree" })

-- ================================
-- TERMINAL
-- ================================

-- Terminal (floating and splits)
map("n", "<leader>tf", function()
  require("nvchad.term").new { pos = "float" }
end, { desc = "Terminal (float)" })
map("n", "<leader>th", function()
  require("nvchad.term").new { pos = "sp" }
end, { desc = "Terminal (horizontal)" })
map("n", "<leader>tv", function()
  require("nvchad.term").new { pos = "vsp" }
end, { desc = "Terminal (vertical)" })

-- Terminal toggles
map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "Terminal (float)" })
map({ "n", "t" }, "<A-h>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "Terminal (horizontal)" })
map({ "n", "t" }, "<A-v>", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "Terminal (vertical)" })

-- Terminal escape
map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
map("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- ================================
-- LSP & DIAGNOSTICS
-- ================================

-- LSP actions
map("n", "<leader>cl", "<cmd>LspInfo<cr>", { desc = "Lsp Info" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
map("n", "gr", "<cmd>Telescope lsp_references<cr>", { desc = "References" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })
map("n", "gI", "<cmd>Telescope lsp_implementations<cr>", { desc = "Goto Implementation" })
map("n", "gy", "<cmd>Telescope lsp_type_definitions<cr>", { desc = "Goto T[y]pe Definition" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
map("n", "gK", vim.lsp.buf.signature_help, { desc = "Signature Help" })
map("i", "<c-k>", vim.lsp.buf.signature_help, { desc = "Signature Help" })

-- Code actions
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
map("n", "<leader>cA", function()
  vim.lsp.buf.code_action {
    context = { only = { "source" }, diagnostics = {} },
  }
end, { desc = "Source Action" })

-- Rename
map("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename" })

-- Formatting
map({ "n", "v" }, "<leader>cf", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "Format" })

-- Diagnostics
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev Diagnostic" })
map("n", "]e", function()
  vim.diagnostic.goto_next { severity = vim.diagnostic.severity.ERROR }
end, { desc = "Next Error" })
map("n", "[e", function()
  vim.diagnostic.goto_prev { severity = vim.diagnostic.severity.ERROR }
end, { desc = "Prev Error" })
map("n", "]w", function()
  vim.diagnostic.goto_next { severity = vim.diagnostic.severity.WARN }
end, { desc = "Next Warning" })
map("n", "[w", function()
  vim.diagnostic.goto_prev { severity = vim.diagnostic.severity.WARN }
end, { desc = "Prev Warning" })

-- ================================
-- GIT
-- ================================

-- Git signs
map("n", "]h", function()
  require("gitsigns").next_hunk()
end, { desc = "Next Hunk" })
map("n", "[h", function()
  require("gitsigns").prev_hunk()
end, { desc = "Prev Hunk" })
map({ "n", "v" }, "<leader>ghs", function()
  require("gitsigns").stage_hunk()
end, { desc = "Stage Hunk" })
map({ "n", "v" }, "<leader>ghr", function()
  require("gitsigns").reset_hunk()
end, { desc = "Reset Hunk" })
map("n", "<leader>ghS", function()
  require("gitsigns").stage_buffer()
end, { desc = "Stage Buffer" })
map("n", "<leader>ghu", function()
  require("gitsigns").undo_stage_hunk()
end, { desc = "Undo Stage Hunk" })
map("n", "<leader>ghR", function()
  require("gitsigns").reset_buffer()
end, { desc = "Reset Buffer" })
map("n", "<leader>ghp", function()
  require("gitsigns").preview_hunk()
end, { desc = "Preview Hunk" })
map("n", "<leader>ghb", function()
  require("gitsigns").blame_line { full = true }
end, { desc = "Blame Line" })
map("n", "<leader>ghd", function()
  require("gitsigns").diffthis()
end, { desc = "Diff This" })
map("n", "<leader>ghD", function()
  require("gitsigns").diffthis "~"
end, { desc = "Diff This ~" })

-- Git telescope
map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "Commits" })
map("n", "<leader>gs", "<cmd>Telescope git_status<CR>", { desc = "Status" })

-- Text objects for git hunks
map({ "o", "x" }, "ih", function()
  require("gitsigns").select_hunk()
end, { desc = "GitSigns Select Hunk" })

-- ================================
-- DEBUGGING
-- ================================

-- Debug Adapter Protocol (DAP)
map("n", "<leader>dB", function()
  require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ")
end, { desc = "Breakpoint Condition" })
map("n", "<leader>db", function()
  require("dap").toggle_breakpoint()
end, { desc = "Toggle Breakpoint" })
map("n", "<leader>dc", function()
  require("dap").continue()
end, { desc = "Continue" })
map("n", "<leader>da", function()
  require("dap").continue { before = get_args }
end, { desc = "Run with Args" })
map("n", "<leader>dC", function()
  require("dap").run_to_cursor()
end, { desc = "Run to Cursor" })
map("n", "<leader>dg", function()
  require("dap").goto_()
end, { desc = "Go to Line (No Execute)" })
map("n", "<leader>di", function()
  require("dap").step_into()
end, { desc = "Step Into" })
map("n", "<leader>dj", function()
  require("dap").down()
end, { desc = "Down" })
map("n", "<leader>dk", function()
  require("dap").up()
end, { desc = "Up" })
map("n", "<leader>dl", function()
  require("dap").run_last()
end, { desc = "Run Last" })
map("n", "<leader>do", function()
  require("dap").step_out()
end, { desc = "Step Out" })
map("n", "<leader>dO", function()
  require("dap").step_over()
end, { desc = "Step Over" })
map("n", "<leader>dp", function()
  require("dap").pause()
end, { desc = "Pause" })
map("n", "<leader>dr", function()
  require("dap").repl.toggle()
end, { desc = "Toggle REPL" })
map("n", "<leader>ds", function()
  require("dap").session()
end, { desc = "Session" })
map("n", "<leader>dt", function()
  require("dap").terminate()
end, { desc = "Terminate" })
map("n", "<leader>dw", function()
  require("dap.ui.widgets").hover()
end, { desc = "Widgets" })

-- Debug UI
map("n", "<leader>du", function()
  require("dapui").toggle {}
end, { desc = "Dap UI" })
map({ "n", "v" }, "<leader>de", function()
  require("dapui").eval()
end, { desc = "Eval" })

-- ================================
-- UTILITY & PLUGIN MANAGEMENT
-- ================================

-- Lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Mason
map("n", "<leader>cm", "<cmd>Mason<cr>", { desc = "Mason" })

-- Trouble + Quickfix navigation
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
map("n", "<leader>xq", "<cmd>Trouble quickfix toggle<cr>", { desc = "Quickfix (Trouble)" })
map("n", "<leader>xl", "<cmd>Trouble loclist toggle<cr>", { desc = "Loclist (Trouble)" })
map("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })
map("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
map("n", "gR", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { desc = "LSP References (Trouble)" })
-- Quit/Save shortcuts
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })
map("n", "<leader>qw", "<cmd>wqa<cr>", { desc = "Save and Quit All" })

-- ================================
-- UI TOGGLES & UTILITIES
-- ================================

-- Theme picker
map("n", "<leader>ut", function()
  require("nvchad.themes").open()
end, { desc = "Theme picker" })

-- Toggle transparency
map("n", "<leader>ui", function()
  -- Flip transparency flag
  vim.g.transparency = not vim.g.transparency

  -- Reload base46 so UI picks up change
  require("base46").toggle_transparency()
end, { desc = "Toggle Transparency" })

-- Line numbers toggle
map("n", "<leader>ul", function()
  vim.opt_local.number = not vim.opt_local.number:get()
end, { desc = "Toggle Line Numbers" })

-- Relative numbers toggle
map("n", "<leader>ur", function()
  vim.opt_local.relativenumber = not vim.opt_local.relativenumber:get()
end, { desc = "Toggle Relative Numbers" })

-- Word wrap toggle
map("n", "<leader>uw", function()
  vim.opt_local.wrap = not vim.opt_local.wrap:get()
end, { desc = "Toggle Word Wrap" })

-- Noice.nvim utilities
map("n", "<leader>nd", "<cmd>NoiceDismiss<cr>", { desc = "Dismiss Notifications" })
map("n", "<leader>nh", "<cmd>NoiceHistory<cr>", { desc = "Notification History" })

-- Live Server
map("n", "<leader>ls", "<cmd>LiveServerStart<cr>", { desc = "Start Live Server" })
map("n", "<leader>lx", "<cmd>LiveServerStop<cr>", { desc = "Stop Live Server" })

-- Showkeys toggle
map("n", "<leader>uk", "<cmd>ShowkeysToggle<cr>", { desc = "Toggle Showkeys" })

-- Typr (typing practice)
map("n", "<leader>ty", "<cmd>Typr<cr>", { desc = "Start Typr" })
map("n", "<leader>ts", "<cmd>TyprStats<cr>", { desc = "Typr Stats" })

-- Cheatsheet
map("n", "<leader>ch", "<cmd>NvCheatsheet<cr>", { desc = "Mapping cheatsheet" })

-- Minty
-- map("n", "C-", "<cmd>Huefy<cr>", { desc = "Huefy" })
-- map("n", "<leader>ch", "<cmd>NvCheatsheet<cr>", { desc = "" })

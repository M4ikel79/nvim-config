return {
  "mg979/vim-visual-multi",
  branch = "master",
  init = function()
    -- Disable default mappings to avoid conflicts
    vim.g.VM_default_mappings = 0
  end,
  config = function()
    -- Custom vim-visual-multi mappings that don't conflict with your setup
    vim.g.VM_maps = {
      -- Core functionality (now <C-n> is available since you'll move nvim-tree to <C-e>)
      ["Find Under"] = "<C-n>", -- Select word under cursor
      ["Find Subword Under"] = "<C-n>", -- Select subword under cursor
      ["Select All"] = "<C-A-n>", -- Select all occurrences of word
      ["Skip Region"] = "<C-x>", -- Skip current and find next
      ["Remove Region"] = "<C-p>", -- Remove current cursor/selection

      -- Visual mode operations
      ["Visual Regex"] = "<leader>vr", -- Start regex search in visual mode
      ["Visual All"] = "<leader>va", -- Select all matches in visual selection
      ["Visual Add"] = "<leader>va", -- Add visual selection as cursor
      ["Visual Find"] = "<leader>vf", -- Find pattern in visual selection

      -- Cursor navigation (using Alt to avoid conflicts with window resize)
      ["Add Cursor Down"] = "<A-j>", -- Add cursor on line below
      ["Add Cursor Up"] = "<A-k>", -- Add cursor on line above
      ["Add Cursor At Pos"] = "<A-LeftMouse>", -- Add cursor with mouse

      -- Text selection expansion (using Alt to avoid window resize conflicts)
      ["Select l"] = "<A-l>", -- Extend selection right
      ["Select h"] = "<A-h>", -- Extend selection left
      ["Select j"] = "<A-Down>", -- Extend selection down
      ["Select k"] = "<A-Up>", -- Extend selection up

      -- Alignment and formatting
      ["Align"] = "<leader>vA", -- Align all cursors
      ["Align Char"] = "<leader>vac", -- Align by character
      ["Align Regex"] = "<leader>var", -- Align by regex

      -- Case operations
      ["Switch Case"] = "<leader>vc", -- Cycle through case options
      ["Toggle Case"] = "~", -- Toggle case of selection

      -- Miscellaneous
      ["Undo"] = "u", -- Undo in multi-cursor mode
      ["Redo"] = "<C-r>", -- Redo in multi-cursor mode
      ["Exit"] = "<Esc>", -- Exit multi-cursor mode

      -- Advanced features
      ["Increase"] = "<C-A>", -- Increment numbers
      ["Decrease"] = "<C-X>", -- Decrement numbers
      ["Add Cursor At Word"] = "<C-A-n>", -- Add cursor at each word occurrence

      -- Column operations
      ["Select Cursor Down"] = "<S-A-j>", -- Select column down
      ["Select Cursor Up"] = "<S-A-k>", -- Select column up
    }

    -- Additional VM settings for better experience
    vim.g.VM_theme = "iceblue"
    vim.g.VM_highlight_matches = "underline"
    vim.g.VM_silent_exit = 1
    vim.g.VM_quit_after_leaving_insert_mode = 0
    vim.g.VM_show_warnings = 1

    -- Set up some useful VM commands
    vim.g.VM_custom_commands = {
      ["Duplicate"] = "normal! yyp",
      ["Delete Line"] = "normal! dd",
    }
  end,
}

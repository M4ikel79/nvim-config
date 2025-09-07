# Neovim Configuration

A customized Neovim setup based on NvChad, featuring modern plugins and development tools.

## Quick Start

```bash
# Clone to your nvim configuration directory
git clone https://github.com/M4ikel79/nvim-config.git ~/.config/nvim

# Start Neovim (plugins will auto-install)
nvim
```

## Features

### Core Features
- **Plugin Management**: lazy.nvim for efficient plugin loading
- **File Explorer**: nvim-tree for intuitive file navigation
- **Git Integration**: Gitsigns and lazygit support
- **Terminal Management**: Multiple terminal layouts
- **Debugging**: Debug Adapter Protocol (DAP) support

### Editing Enhancements
- **Multiple Cursors**: Visual-multi for efficient multi-cursor editing
- **Code Folding**: Origami for advanced folding
- **Live Server**: Real-time web development preview
- **Markdown Support**: Enhanced markdown editing
- **Emmet Support**: HTML/CSS abbreviation expansion

### UI & Themes
- **Dracula Pro**: Dark theme variant
- **Monokai Pro**: High-contrast theme
- **Transparent mode** Transparent background
- **Smooth Scrolling**: Neoscroll for fluid navigation
- **Trouble Integration**: Centralized diagnostics viewer

## Configuration Structure

```
nvim/
├── init.lua              # Main configuration entry point
├── lua/
│   ├── autocmds.lua      # Auto commands
│   ├── chadrc.lua        # Chadrc configuration
│   ├── mappings.lua      # Key mappings
│   ├── options.lua       # Vim options
│   ├── configs/          # Plugin configurations
│   │   ├── conform.lua   # Code formatting
│   │   ├── lazy.lua      # Lazy.nvim setup
│   │   └── lspconfig.lua # LSP configuration
│   ├── plugins/          # Individual plugin configs
│   │   ├── dap.lua       # Debug adapter protocol
│   │   ├── emmet.lua     # Emmet support
│   │   ├── live_server.lua # Live web server
│   │   ├── markdown.lua  # Markdown enhancements
│   │   ├── neoscroll.lua # Smooth scrolling
│   │   ├── nvimtree.lua  # File explorer
│   │   ├── origami.lua   # Code folding
│   │   ├── tmux.lua      # Tmux integration
│   │   ├── trouble.lua   # Diagnostics viewer
│   │   └── visual_multi.lua # Multi-cursor support
│   ├── themes/           # Theme configurations
│   │   ├── dracula-pro.lua
│   │   └── monokai-pro.lua
│   └── utils/
│       └── code_folds.lua # Code folding utilities
└── .stylua.toml         # Lua code formatting rules
```

## Plugin Management

This configuration uses lazy.nvim for plugin management. Plugins are organized by purpose:

- **Development Tools**: DAP, Mason, Treesitter, LSP
- **File Management**: Telescope, nvim-tree
- **Git Integration**: Gitsigns, lazygit
- **Editor Enhancement**: Visual-multi, Origami, Neoscroll
- **UI/UX**: Dracula Pro, Monokai Pro themes

## Requirements

- Neovim 0.8+ with Lua support
- Git for plugin management
- Node.js (for some language servers)
- A Nerd Font (for icons and symbols)

## Key Mappings

Key mappings are defined in `lua/mappings.lua`. The leader key is set to space by default. Common patterns:

- `<leader>fk` - Key mappings
- `<leader>f` - File operations
- `<leader>g` - Git operations
- `<leader>t` - Terminal operations
- `<leader>d` - Debug operations

## Customization

The configuration is modular and easy to extend:

1. **Add new plugins**: Add plugin specs to `lua/plugins/`
2. **Customize options**: Modify `lua/options.lua`
3. **Add themes**: Add or Remove `lua/themes/` files
4. **Add mappings**: Update `lua/mappings.lua`

## Performance

Configuration is optimized for startup performance using lazy.nvim's intelligent loading:
- Plugins load only when needed
- Event-driven loading for better performance
- Minimal impact on startup time

## Maintenance

Regular maintenance commands:
```vim
:Lazy sync       # Update all plugins
:Mason          # Manage language servers/formatters/linters
:LspInfo        # Check LSP status
```

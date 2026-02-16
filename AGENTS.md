# Neovim Configuration - Developer Handover Document

## Overview

This is a Neovim configuration project managed with **lazy.nvim** plugin manager. It is version-controlled via git for easy synchronization across multiple devices.

## Project Structure

```
~/.config/nvim/
├── init.lua                 # Main entry point
├── lua/
│   ├── config/
│   │   ├── lazy.lua         # Lazy.nvim bootstrap & installation
│   │   ├── options.lua      # Neovim global options
│   │   └── keymappings.lua  # Key mappings configuration
│   └── plugins/             # Plugin configurations (28 plugins)
│       ├── autopairs.lua
│       ├── avante.lua       # AI assistant (OpenRouter provider)
│       ├── blink-cmp-avante.lua
│       ├── blink.lua        # Completion engine
│       ├── colorizer.lua
│       ├── conform.lua      # Formatter
│       ├── fugitive.lua     # Git wrapper
│       ├── lazydev.lua      # Lua development
│       ├── lualine.lua      # Statusline
│       ├── luasnip.lua      # Snippets
│       ├── mason.lua        # LSP server manager
│       ├── mason-lspconfig.lua
│       ├── mcphub.lua       # MCP client
│       ├── mini.lua         # Mini plugins
│       ├── nvim-dap.lua     # Debug adapter
│       ├── nvimtree.lua     # File explorer
│       ├── ollama.lua       # Local AI
│       ├── parrot.lua       # AI completion
│       ├── telescope.lua    # Fuzzy finder
│       ├── tokyonight.lua   # Theme
│       ├── treesitter.lua   # Syntax parsing
│       ├── trouble.lua      # Diagnostics
│       ├── vimtmux.lua      # Tmux integration
│       └── whichkey.lua    # Keybinding helper
├── .neoconf.json            # Neovim config for LSP
├── .gitignore
├── bindings.md              # Keybinding cheatsheet
├── Makefile                 # Development commands
└── lazy-lock.json           # Plugin lockfile
```

## Key Configuration Details

### Plugin Manager
- **lazy.nvim** is used as the plugin manager
- Bootstrap code in `lua/config/lazy.lua` clones from `https://github.com/folke/lazy.nvim.git`

### Core Options (lua/config/options.lua)
- Line numbers enabled with relative numbers
- Tab expansion enabled (expandtab)
- Dark theme (Tokyo Night)
- 24-bit colors (termguicolors)
- Clipboard integration: `unnamedplus`
- Global statusline for proper fold display

### Key Mappings (lua/config/keymappings.lua)
- **Leader key**: Space (`<Space>`)
- **Local leader**: Backslash (`\`)
- Split navigation: `<C-h/j/k/l>`
- Buffer navigation: `<S-h>` (prev), `<S-l>` (next)
- Telescope: `<leader>f` or `<leader>ff/fg/fb/fh`

### AI Integration
The config includes multiple AI plugins:
- **Avante.nvim**: AI assistant with OpenRouter provider
  - Model: `minimax/minimax-m2.5`
  - Requires `OPENROUTER_API_KEY` environment variable
- ** Ollama**: Local AI support
- **Parrot**: AI completion
- **Lazydev**: Lua development with AI features

### Debugging (DAP)
- Uses `nvim-dap` with Python support
- Test runner: pytest
- Debug adapter: uv

### LSP Servers
Configured via mason-lspconfig:
- `pyright` - Python
- `ruff` - Python linter/formatter
- `rust_analyzer` - Rust
- `lua_ls` - Lua
- `sourcekit` - Swift

## Development Commands

```bash
# Syntax check all Lua files + Neovim startup test
make health
```

Or manually:
```bash
find . -name '*.lua' -type f -print0 | xargs -0 -n1 luac -p
nvim --headless '+qa'
```

## Important Environment Variables

- `OPENROUTER_API_KEY` - Required for Avante AI assistant
- `OLLAMA_BASE_URL` - For local Ollama AI
- `OLLAMA_MODEL` - For local Ollama AI

## Additional Notes

1. The configuration is designed for Python and Rust development primarily
2. Tokyo Night theme is used with dark background
3. Blink.cmp is configured with super-tab preset for VSCode-like completions
4. Virtual text diagnostics are enabled
5. File tree is managed via NvimTree

## Adding New Plugins

1. Create a new file in `lua/plugins/` (e.g., `lua/plugins/newplugin.lua`)
2. Follow the lazy.nvim format:

```lua
return {
    "author/newplugin",
    -- event = "VeryLazy", -- for lazy loading
    -- dependencies = { "other/plugin" },
    -- config = function() ... end
}
```

3. Restart Neovim and run `:Lazy` to install

## Troubleshooting

- If plugins don't load, run `:Lazy` to see any errors
- Check `:checkhealth` for general Neovim health
- For LSP issues, run `:LspRestart` or `:Mason`


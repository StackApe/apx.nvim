# apx.nvim

ApX language support for Neovim - syntax highlighting, LSP, and code execution.

## Features

- **Language Server (LSP)** - Completions, hover docs, diagnostics, go-to-definition
- **Syntax Highlighting** - Full highlighting for ApX language constructs
- **File Detection** - Automatic detection of `.apx`, `.apxrc`, and `apx.profile`
- **Code Execution** - Run ApX files or lines directly from Neovim
- **Configurable Keymaps** - Quick shortcuts for common actions

## Installation

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "apex-pde/apx.nvim",
  ft = "apx",
  opts = {},
}
```

### [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  "apex-pde/apx.nvim",
  config = function()
    require("apx").setup()
  end,
}
```

### [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'apex-pde/apx.nvim'
```

Then in your init.lua:
```lua
require("apx").setup()
```

### Manual Installation

```bash
git clone https://github.com/apex-pde/apx.nvim ~/.local/share/nvim/site/pack/plugins/start/apx.nvim
```

## Language Server (apx-lsp)

For full IDE features, install the ApX language server:

```bash
# From releases
curl -L https://github.com/apex-pde/apx-lsp/releases/latest/download/apx-lsp-linux -o ~/.local/bin/apx-lsp
chmod +x ~/.local/bin/apx-lsp

# Or build from source
cd apx-lsp && cargo install --path .
```

The LSP provides:
- **Completions** - Commands, variables, snippets
- **Hover Documentation** - Help for commands and keywords
- **Diagnostics** - Syntax error detection
- **Go to Definition** - Jump to macro/alias/variable definitions
- **Document Symbols** - Outline view of macros, aliases, variables

## Configuration

```lua
require("apx").setup({
  -- Path to apx executable (nil = use PATH)
  apx_path = nil,

  -- Path to apx-lsp executable (nil = use PATH)
  lsp_path = nil,

  -- Enable LSP (requires apx-lsp)
  lsp = true,

  -- Keymaps (set to false to disable all)
  keymaps = {
    run_file = "<leader>ar",    -- Run current file
    run_line = "<leader>al",    -- Run current line
  },
})
```

### Disable LSP

```lua
require("apx").setup({
  lsp = false,
})
```

### Disable Keymaps

```lua
require("apx").setup({
  keymaps = false,
})
```

## Commands

| Command | Description |
|---------|-------------|
| `:ApxRun` | Run the current file in a terminal split |
| `:ApxRunLine` | Execute the current line |
| `:ApxEval {expr}` | Evaluate an ApX expression |

## Keymaps

Default keymaps (only active in ApX buffers):

| Keymap | Action |
|--------|--------|
| `<leader>ar` | Run current file |
| `<leader>al` | Run current line |

## LSP Features

With `apx-lsp` installed, you get:

| Feature | Description |
|---------|-------------|
| Completions | Type a command name and get suggestions |
| Hover | Press `K` over a command to see docs |
| Diagnostics | Errors show as you type |
| Go to Definition | `gd` on a macro/alias jumps to definition |
| Document Symbols | `:Telescope lsp_document_symbols` |

## Syntax Highlighting

Highlights include:
- Keywords: `if`, `else`, `for`, `while`, `in`, `macro`, `alias`
- Commands: `echo`, `ls`, `cd`, `git-status`, `ai.ask`, etc.
- Variables: `$name`, `$it`, `$env.VAR`
- Strings, numbers, operators, comments
- Records `{key: value}` and lists `[a, b, c]`

## File Associations

| Pattern | Filetype |
|---------|----------|
| `*.apx` | apx |
| `*.apxrc` | apx |
| `apx.profile` | apx |

## Help

```vim
:help apx.txt
```

## License

MIT - See [LICENSE](LICENSE)

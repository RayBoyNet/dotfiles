# My Neovim configuration

This is a small Lua-first Neovim configuration built incrementally, without a preconfigured distribution.

## Use this configuration on another machine

This repository maps directly to `~/.config/nvim`. On a new machine, install
Neovim and Git, then clone it with:

```sh
git clone https://github.com/RayBoyNet/dotfiles.git ~/.config/nvim
```

Start Neovim to let lazy.nvim and Mason install the configured plugins and
language servers. This repository currently contains the Neovim configuration;
Starship and shell settings can be added separately if this becomes a broader
dotfiles setup.

## Layout

- `init.lua` is Neovim's entry point. It loads the core configuration modules.
- `lua/config/clipboard.lua` configures WSL-to-Windows clipboard access through
  `win32yank.exe` when that executable is available.
- `lua/config/options.lua` contains editor settings.
- `lua/config/keymaps.lua` contains custom key mappings.
- `lua/config/autocmds.lua` contains event-driven behavior.
- `lua/config/lazy.lua` bootstraps lazy.nvim and imports plugin specifications.
- `lua/plugins/` will contain one Lua file per plugin or tightly related plugin feature.

## How Lua modules work here

Neovim adds `~/.config/nvim/lua/` to Lua's module search path. Therefore
`require("config.options")` loads `lua/config/options.lua`. `require` runs that
file once per Neovim session and returns any value it explicitly returns.

## Maintenance

- Keep `init.lua` as a short list of module imports.
- Put a setting, mapping, or autocommand in its matching `config/` file.
- Add plugins one at a time under `lua/plugins/`, documenting their purpose and
  key bindings.
- After changes, start Neovim and run `:checkhealth`.
- Update plugins with `:Lazy update` once lazy.nvim is installed; review the
  changes before accepting behavior differences.

## Plugin management

lazy.nvim installs itself in Neovim's user data directory on the first startup.
It imports plugin specifications from `lua/plugins/`. Use `:Lazy` to inspect
plugins and `:Lazy update` to update them; lazy.nvim records resolved versions
in `lazy-lock.json` for reproducibility.

## Installed plugins

- `nvim-treesitter/nvim-treesitter` provides structural parsing and improved
  highlighting. This configuration uses its `master` compatibility branch
  because Neovim 0.11 cannot use the current 0.12+ rewrite. Parsers for Lua,
  Vim files, shell scripts, JSON, YAML, and Markdown are installed initially.
- `mason-org/mason.nvim` manages external developer tools in Neovim's user data
  directory.
- `neovim/nvim-lspconfig` supplies language-server definitions for Neovim's
  built-in LSP client.
- `mason-org/mason-lspconfig.nvim` installs and enables `lua_ls` and
  BasedPyright. LuaLS is pinned to version 3.18.2 until the current 3.19
  server-release handshake regression is resolved. BasedPyright provides
  Python argument-name inlay hints; Neovim's built-in LSP UI displays them
  automatically when the server attaches to a Python buffer.
- `saghen/blink.cmp` provides LSP, path, buffer, and snippet completion. It is
  pinned to the stable v1 release line and uses Neovim's built-in snippet support.
  Its experimental automatic signature window is enabled.
- `nvim-telescope/telescope.nvim` provides fuzzy search; `nvim-lua/plenary.nvim`
  supplies its required Lua utilities.

## Core mappings

- `Space` is the leader key; `Space w` saves the current file.
- `Escape` clears search highlighting.
- `Ctrl-h`, `Ctrl-j`, `Ctrl-k`, and `Ctrl-l` move between splits.
- `[d` and `]d` move through diagnostics; `Space e` shows the diagnostic under
  the cursor.
- In a buffer with an attached language server, `gd` goes to a definition, `gr`
  finds references, `K` shows documentation, `Space rn` renames a symbol, and
  `Space ca` offers code actions.
- Blink's default Insert mode mappings use `Ctrl-Space` to open completion,
  `Ctrl-n`/`Ctrl-p` to select items, `Ctrl-y` to confirm, and `Ctrl-e` to hide
  the menu. `Ctrl-k` toggles signature help; LSP trigger characters can show it
  automatically while entering function arguments.
- `Space ff` finds files, `Space fg` searches project text, `Space fb` lists open
  buffers, and `Space fh` searches Neovim help.

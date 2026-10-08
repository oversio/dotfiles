# dotfiles

Personal dotfiles for macOS managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Structure

```
dotfiles/
├── nvim/        # Neovim (AstroNvim-based)
├── zsh/         # Zsh + Powerlevel10k
├── tmux/        # Tmux
├── startship/   # Starship prompt
├── wezterm/     # WezTerm terminal emulator
└── helix/       # Helix editor
```

Backup Neovim configs live in `nvim-YYYY-MM-DD/` directories — do not delete them.

## Package Management

Each top-level directory is a Stow package. Stow symlinks its contents into `$HOME`.

```bash
stow nvim       # link a package
stow -D nvim    # unlink a package
stow */         # link everything
```

## Key Tools

| Tool | Purpose |
|------|---------|
| Neovim | Primary editor (AstroNvim + Codeium AI + OneDark theme) |
| Zsh | Shell with Powerlevel10k; includes Laravel aliases |
| Tmux | Terminal multiplexer with path retention on splits |
| Starship | Fast cross-shell prompt |
| WezTerm | GPU-accelerated terminal emulator |
| Helix | Secondary modal editor |

## Notes

- Configs are modular — each package works independently.
- Neovim is set up for VSCode integration and Laravel/PHP workflows.
- When editing Lua configs under `nvim/`, changes apply after restarting Neovim (`:Lazy sync` for plugin changes).
- Zsh config lives at `zsh/.zshrc`; reload with `source ~/.zshrc`.
- Tmux config lives at `tmux/.tmux.conf`; reload with `tmux source ~/.tmux.conf`.

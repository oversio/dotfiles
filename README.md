<div align="center">

# ✨ dotfiles

### *My carefully crafted development environment*

**Modern • Efficient • Beautiful**

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

</div>

---

## 📖 Overview

This repository contains my personal dotfiles and configurations for a productive development environment on macOS. These configurations have been refined over time to create a fast, aesthetic, and efficient workflow.

## 🎯 What's Inside

### 🚀 **Neovim**
Fully configured [AstroNvim](https://astronvim.com/) setup with custom plugins and integrations:
- **AI-powered completions** with Codeium
- **Advanced file navigation** with Neo-tree
- **LSP & diagnostics** with Astro LSP and Trouble
- **Git integration** with custom utilities
- **Code snippets** for faster development
- **Custom transparency** and OneDark theme
- **VSCode integration** ready

### 💻 **Terminal Setup**
- **Zsh** - Powerful shell with Powerlevel10k theme
- **Tmux** - Terminal multiplexer with smart path retention
- **Starship** - Minimal, fast, and customizable prompt
- **WezTerm** - Modern GPU-accelerated terminal emulator

### ⚡ **Additional Tools**
- **Helix** - Post-modern modal text editor configuration

## 🛠️ Installation

### Prerequisites

```bash
# Install Homebrew (if not already installed)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install essential tools
brew install neovim tmux zsh starship stow
brew install --cask wezterm
```

### Quick Setup

#### Using GNU Stow (Recommended)

This repository uses [GNU Stow](https://www.gnu.org/software/stow/), a symlink farm manager, to manage dotfile symlinks. Stow automatically creates and manages symlinks from this repository to your home directory.

```bash
# Clone this repository
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Use stow to create symlinks for each configuration
stow nvim
stow zsh
stow tmux
stow startship
stow wezterm
stow helix

# Or stow everything at once
stow */

# Reload your shell
source ~/.zshrc
```

**Benefits of using Stow:**
- ✨ Automatic symlink management
- 🔄 Easy to unstow (remove) configurations with `stow -D <package>`
- 🎯 Clean and organized package-based structure
- 🛡️ Conflict detection before creating symlinks

#### Manual Setup (Alternative)

If you prefer not to use stow, you can create symlinks manually:

```bash
# Clone this repository
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Symlink configurations manually
ln -sf ~/dotfiles/nvim/.config/nvim ~/.config/nvim
ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/startship/.config/starship.toml ~/.config/starship.toml
ln -sf ~/dotfiles/wezterm/.wezterm.lua ~/.wezterm.lua
ln -sf ~/dotfiles/helix/.config/helix ~/.config/helix

# Reload your shell
source ~/.zshrc
```

## ✨ Features

### Neovim Highlights
- 🎨 **Custom OneDark theme** with transparency support
- 🤖 **AI-powered code completion** via Codeium
- 🔍 **Fuzzy finding** and powerful search capabilities
- 📝 **Code snippets** for rapid development
- 🌳 **Advanced file tree** with Neo-tree
- 🔧 **LSP support** for multiple languages
- 🎯 **Diagnostic management** with Trouble

### Terminal Experience
- ⚡ **Lightning-fast prompt** with Starship
- 🎭 **Beautiful Powerlevel10k** theme for Zsh
- 🪟 **Smart window management** with Tmux
- 🎨 **GPU-accelerated rendering** with WezTerm
- 📂 **Path retention** on split and new panes

## 📚 Structure

```
dotfiles/
├── nvim/              # Neovim configuration (AstroNvim-based)
│   └── .config/nvim/  # Main config directory
│       ├── init.lua   # Entry point
│       └── lua/       # Lua plugin configurations
├── zsh/               # Zsh shell configuration
│   └── .zshrc         # Main Zsh config with Powerlevel10k
├── tmux/              # Tmux terminal multiplexer
│   └── .tmux.conf     # Tmux configuration
├── startship/         # Starship prompt
│   └── .config/       # Starship config
├── wezterm/           # WezTerm terminal emulator
│   └── .wezterm.lua   # WezTerm configuration
└── helix/             # Helix editor
    └── .config/       # Helix configuration
```

## 🎨 Customization

Each configuration is modular and can be used independently. Feel free to:
- Mix and match components
- Adjust colors and themes
- Add or remove plugins
- Modify keybindings to your preference

## 📝 Notes

- **Neovim versions**: Backup configurations are available in `nvim-YYYY-MM-DD/` directories
- **Laravel support**: Zsh includes Laravel-specific configurations
- **VSCode integration**: Neovim is configured to work seamlessly with VSCode

## 🤝 Contributing

While these are personal configurations, suggestions and improvements are welcome! Feel free to open an issue or submit a pull request.

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

---

<div align="center">

**[⬆ back to top](#-dotfiles)**

*Built with ❤️ for developers who care about their environment*

</div>

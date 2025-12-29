# Neoconf - Project-Specific Configuration

## Quick Start

### 1. Basic Usage

Create a `.neoconf.json` file in your project root:

```json
{
  "$schema": "https://raw.githubusercontent.com/folke/neoconf.nvim/main/schemas/neoconf.json"
}
```

### 2. LSP Configuration

Configure LSP servers per project:

```json
{
  "lspconfig": {
    "lua_ls": {
      "Lua.diagnostics.globals": ["vim", "awesome"],
      "Lua.workspace.checkThirdParty": false
    },
    "vtsls": {
      "typescript.inlayHints.parameterNames.enabled": "all",
      "javascript.preferences.importModuleSpecifier": "relative"
    },
    "pyright": {
      "python.analysis.typeCheckingMode": "strict"
    }
  }
}
```

### 3. Neovim Options

Override vim options per project:

```json
{
  "options": {
    "tabstop": 4,
    "shiftwidth": 4,
    "colorcolumn": "120",
    "spell": true,
    "spelllang": "en_us"
  }
}
```

### 4. Plugin Settings

Configure plugins per project:

```json
{
  "plugins": {
    "codeium": {
      "enabled": false
    },
    "copilot": {
      "enabled": true
    }
  }
}
```

### 5. Import from VSCode

Neoconf can automatically import settings from `.vscode/settings.json`:

```json
// .vscode/settings.json
{
  "typescript.preferences.importModuleSpecifier": "relative",
  "editor.tabSize": 2
}
```

This will be automatically merged with your `.neoconf.json` settings.

## Commands

- `:Neoconf` - Open project-local settings
- `:Neoconf global` - Open global settings
- `:Neoconf show` - Show merged settings for current buffer
- `:Neoconf lsp` - Show LSP settings

## Real-World Examples

### Frontend Project (React/TypeScript)

```json
{
  "lspconfig": {
    "vtsls": {
      "typescript.inlayHints.parameterNames.enabled": "all",
      "typescript.inlayHints.functionLikeReturnTypes.enabled": true,
      "typescript.preferences.importModuleSpecifier": "non-relative"
    },
    "tailwindcss": {
      "experimental.classRegex": [
        ["cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]"]
      ]
    }
  },
  "options": {
    "tabstop": 2,
    "shiftwidth": 2,
    "colorcolumn": "100"
  }
}
```

### Python Data Science Project

```json
{
  "lspconfig": {
    "pyright": {
      "python.analysis.typeCheckingMode": "basic",
      "python.analysis.autoImportCompletions": true,
      "python.analysis.diagnosticSeverityOverrides": {
        "reportUnusedVariable": "none"
      }
    }
  },
  "options": {
    "tabstop": 4,
    "shiftwidth": 4,
    "colorcolumn": "88"
  }
}
```

### Neovim Plugin Development

```json
{
  "lspconfig": {
    "lua_ls": {
      "Lua.runtime.version": "LuaJIT",
      "Lua.diagnostics.globals": ["vim"],
      "Lua.workspace.library": [
        "${3rd}/luv/library",
        "${3rd}/busted/library"
      ],
      "Lua.workspace.checkThirdParty": false
    }
  },
  "options": {
    "tabstop": 2,
    "shiftwidth": 2
  }
}
```

## Tips

1. **Schema validation**: The `$schema` line enables autocomplete in editors
2. **Inheritance**: Project settings override global settings
3. **Live reload**: Changes to `.neoconf.json` apply immediately
4. **Version control**: Commit `.neoconf.json` to share settings with team
5. **Per-filetype**: Use `.neoconf.jsonc` for comments support

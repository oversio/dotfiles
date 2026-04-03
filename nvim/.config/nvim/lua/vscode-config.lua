-- VSCode Neovim Configuration Guide
-- ===================================
-- Este archivo documenta cómo diferenciar plugins entre Neovim nativo y VSCode

-- La extensión VSCode Neovim establece vim.g.vscode = true
-- Úsalo para condicionar la carga de plugins

--[[ PATRÓN BÁSICO:

return {
  "nombre/plugin",
  cond = not vim.g.vscode,  -- Solo en Neovim nativo
  -- ó
  cond = vim.g.vscode,       -- Solo en VSCode
}

]]

-- PLUGINS QUE DEBERÍAS DESHABILITAR EN VSCODE (cond = not vim.g.vscode):
-- ========================================================================
-- ✓ alpha-nvim (ya actualizado) - Pantalla de inicio
-- ✓ neo-tree (ya actualizado) - Explorador de archivos (VSCode tiene el suyo)
-- ✓ astroui (ya actualizado) - UI/Temas (VSCode maneja sus temas)
-- - nvim-notify / noice.nvim - Notificaciones (VSCode tiene las suyas)
-- - bufferline.nvim - Tabs (VSCode maneja tabs)
-- - lualine.nvim / heirline.nvim - Statusline (VSCode tiene statusbar)
-- - telescope.nvim - Finder (OPCIONAL: puede funcionar, pero VSCode tiene Ctrl+P)
-- - indent-blankline.nvim - Guías de indentación (VSCode tiene las suyas)
-- - gitsigns.nvim - Git decorations (VSCode tiene GitLens y decoraciones nativas)

-- PLUGINS QUE FUNCIONAN BIEN EN VSCODE (sin cond o cond = true):
-- ===============================================================
-- ✓ nvim-treesitter - Parsing de sintaxis
-- ✓ nvim-surround / vim-surround - Text objects
-- ✓ Comment.nvim - Comentarios
-- ✓ nvim-cmp - Autocompletado (puede coexistir con VSCode)
-- ✓ LuaSnip / friendly-snippets - Snippets
-- ✓ nvim-lspconfig - LSP (funciona junto a VSCode LSP)
-- ✓ which-key.nvim - Ayuda de teclas
-- ✓ nvim-autopairs - Auto paréntesis
-- ✓ flash.nvim / hop.nvim - Navegación rápida

-- CONFIGURACIÓN CONDICIONAL EN INIT.LUA O POLISH.LUA:
-- ====================================================
if vim.g.vscode then
  -- Configuración específica para VSCode
  -- Ejemplo: Mapeos que usan comandos de VSCode
  vim.keymap.set("n", "<leader>ff", "<cmd>call VSCodeNotify('workbench.action.quickOpen')<cr>")
  vim.keymap.set("n", "<leader>fg", "<cmd>call VSCodeNotify('workbench.action.findInFiles')<cr>")
else
  -- Configuración específica para Neovim nativo
  -- Tus opciones de UI, colorscheme, etc.
end

-- EJEMPLO DE PLUGIN CON CONFIGURACIÓN DIFERENTE:
-- ===============================================
--[[
return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    if vim.g.vscode then
      -- Configuración minimalista para VSCode
      opts.sources = {
        { name = "buffer" },
      }
    else
      -- Configuración completa para Neovim
      opts.sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      }
    end
    return opts
  end,
}
]]

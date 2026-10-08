-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Enable native EditorConfig support (Neovim 0.9+)
vim.g.editorconfig = true

-- Convertir indentación del buffer actual o de una selección visual
local function tabs_to_spaces(buf, line1, line2)
  local size = vim.bo[buf].tabstop
  local lines = vim.api.nvim_buf_get_lines(buf, line1 - 1, line2, false)
  local spaces = string.rep(" ", size)
  for i, line in ipairs(lines) do
    lines[i] = line:gsub("\t", spaces)
  end
  vim.api.nvim_buf_set_lines(buf, line1 - 1, line2, false, lines)
  return size
end

local function spaces_to_tabs(buf, line1, line2)
  local size = vim.bo[buf].tabstop
  local spaces = string.rep(" ", size)
  local lines = vim.api.nvim_buf_get_lines(buf, line1 - 1, line2, false)
  for i, line in ipairs(lines) do
    lines[i] = line:gsub(spaces, "\t")
  end
  vim.api.nvim_buf_set_lines(buf, line1 - 1, line2, false, lines)
  return size
end

vim.api.nvim_create_user_command("TabsToSpaces", function(opts)
  local buf = vim.api.nvim_get_current_buf()
  local line1 = opts.range > 0 and opts.line1 or 1
  local line2 = opts.range > 0 and opts.line2 or vim.api.nvim_buf_line_count(buf)
  local size = tabs_to_spaces(buf, line1, line2)
  if opts.range == 0 then vim.bo[buf].expandtab = true end
  vim.notify(("Convertido a spaces (indent=%d) [líneas %d-%d]"):format(size, line1, line2))
end, { desc = "Convertir tabs a spaces", range = true })

vim.api.nvim_create_user_command("SpacesToTabs", function(opts)
  local buf = vim.api.nvim_get_current_buf()
  local line1 = opts.range > 0 and opts.line1 or 1
  local line2 = opts.range > 0 and opts.line2 or vim.api.nvim_buf_line_count(buf)
  local size = spaces_to_tabs(buf, line1, line2)
  if opts.range == 0 then vim.bo[buf].expandtab = false end
  vim.notify(("Convertido a tabs (tabstop=%d) [líneas %d-%d]"):format(size, line1, line2))
end, { desc = "Convertir spaces a tabs", range = true })

-- Mostrar caracteres de indentación (como VS Code)
vim.opt.list = true
vim.opt.listchars = {
  tab = " →",      -- flechas para tabs
  lead = "·",      -- puntos medios para espacios al inicio de línea
  trail = "·",     -- espacios al final de línea
  nbsp = "␣",      -- espacio no-separable
}

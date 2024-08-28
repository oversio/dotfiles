-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "javascript",
      "typescript",
      "tsx",
      "json",
      "css",
      "html",
      "bash",
      "markdown",
      "markdown_inline",
      -- add more arguments for adding more treesitter parsers
    },
    rainbow = {
      enable = true, -- Enable rainbow parentheses
      extended_mode = true, -- Highlight also non-parentheses delimiters
    },
  },
}

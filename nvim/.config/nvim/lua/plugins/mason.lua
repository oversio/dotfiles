-- Customize Mason

---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- LSPs
        "css-lsp",
        "emmet-ls",
        "eslint-lsp",
        "html-lsp",
        "json-lsp",
        "lua-language-server",
        "tailwindcss-language-server",
        "vtsls",
        "yaml-language-server",

        -- Formatters
        "prettierd",
        "stylua",

        -- Linters
        "eslint_d",
        "selene",

        -- Debuggers
        "js-debug-adapter",
      },
    },
  },
}

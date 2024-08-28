-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Mason plugins

---@type LazySpec
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = {
      ensure_installed = {
        "lua_ls", -- Lua language server
        "tsserver", -- TypeScript and JavaScript language server
        "eslint", -- ESLint language server for linting
        "tailwindcss", -- TailwindCSS language server
        "jsonls", -- JSON language server for configuration files
        "html", -- HTML language server
        "cssls", -- CSS language server
      },
    },
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = {
      ensure_installed = {
        "stylua", -- Lua formatter
        "prettier", -- Prettier for code formatting
        "eslint_d", -- ESLint for faster linting
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = {
      ensure_installed = {
        "chrome", -- Debugger for JavaScript/TypeScript in Chrome
        "node2",
      },
    },
  },
}

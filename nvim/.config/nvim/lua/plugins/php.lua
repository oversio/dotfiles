---@type LazySpec
return {
  -- Blade syntax highlighting
  {
    "jwalton512/vim-blade",
    ft = { "blade" },
  },

  -- Treesitter parsers for PHP ecosystem
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "php",
        "html",
        "css",
        "javascript",
        "twig",
      })
    end,
  },

  -- Filetype detection for .blade.php files
  {
    "nvim-treesitter/nvim-treesitter",
    init = function()
      vim.filetype.add({
        pattern = {
          [".*%.blade%.php"] = "blade",
          [".*%.twig"] = "twig",
        },
      })
    end,
  },

  -- Format blade files on save via none-ls (no LSP attached for blade)
  {
    "AstroNvim/astrocore",
    opts = {
      autocmds = {
        blade_format_on_save = {
          {
            event = "BufWritePre",
            pattern = "*.blade.php",
            callback = function() vim.lsp.buf.format({ async = false }) end,
          },
        },
      },
    },
  },
}

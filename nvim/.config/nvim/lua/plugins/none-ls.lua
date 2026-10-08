-- Customize None-ls sources

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    local null_ls = require "null-ls"

    opts.sources = require("astrocore").list_insert_unique(opts.sources, {
      null_ls.builtins.formatting.prettierd,
      -- djlint solo para HTML.
      null_ls.builtins.formatting.djlint.with({
        filetypes = { "html" },
        extra_args = { "--indent", "2", "--max-line-length", "120", "--max-attribute-length", "120" },
      }),
      -- .twig -> prettier + @zackad/prettier-plugin-twig (instalado global).
      -- La config vive fuera del repo; protege <script> con {# prettier-ignore #}.
      null_ls.builtins.formatting.prettier.with({
        filetypes = { "twig" },
        extra_args = { "--config", vim.fn.expand "~/.config/prettier/twig.json" },
      }),
      null_ls.builtins.formatting.pint.with({
        command = function()
          local local_pint = vim.fn.getcwd() .. "/vendor/bin/pint"
          return vim.fn.executable(local_pint) == 1 and local_pint or "pint"
        end,
        filetypes = { "php" },
      }),
      null_ls.builtins.formatting.blade_formatter,
    })
  end,
}

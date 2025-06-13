return {
  "lewis6991/gitsigns.nvim",
  opts = function(_, opts)
    opts.keymaps = opts.keymaps or {}
    vim.keymap.set("n", "<leader>gh", ":Gitsigns preview_hunk<CR>", { silent = true })
    return opts
  end,
}

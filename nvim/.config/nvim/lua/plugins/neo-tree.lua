return {
  "nvim-neo-tree/neo-tree.nvim",
  cond = not vim.g.vscode, -- Deshabilitar en VSCode (usa el explorador de VSCode)
  opts = {
    window = {
      position = "right",
    },
  },
}

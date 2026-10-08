return {
  "nvim-neo-tree/neo-tree.nvim",
  cond = not vim.g.vscode, -- Deshabilitar en VSCode (usa el explorador de VSCode)
  opts = {
    window = {
      position = "right",
    },
    -- Los tests viven junto a su fuente (co-location). Plegarlos bajo ella deja
    -- la carpeta limpia sin mover archivos ni partir la convención.
    -- Una fuente `.ts` puede tener su test en `.tsx` (los tests de hooks/api que
    -- renderizan con providers), por eso la regla de `ts` busca ambas.
    nesting_rules = {
      ["ts-source"] = {
        pattern = "^(.-)%.ts$",
        files = { "%1.test.ts", "%1.test.tsx", "%1.spec.ts", "%1.spec.tsx" },
      },
      ["tsx-source"] = {
        pattern = "^(.-)%.tsx$",
        files = { "%1.test.tsx", "%1.spec.tsx" },
      },
    },
  },
}

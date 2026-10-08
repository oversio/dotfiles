return {
  "folke/snacks.nvim",
  opts = {
    notifier = {
      enabled = false,
    },
    image = {
      enabled = true,
      -- WezTerm soporta el kitty graphics protocol de forma nativa
      -- (tmux necesita `allow-passthrough on`, ya configurado en .tmux.conf)
      doc = {
        -- renderiza imágenes referenciadas en markdown/otros al mover el cursor
        inline = true,
        float = true,
      },
    },
  },
}

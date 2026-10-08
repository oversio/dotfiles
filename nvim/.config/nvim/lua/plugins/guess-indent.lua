return {
  "nmac427/guess-indent.nvim",
  event = "BufReadPre",
  opts = {
    auto_cmd = true, -- detecta indentación al abrir cualquier buffer
    override_editorconfig = false, -- respeta .editorconfig si existe
    filetype_exclude = {
      "neotree",
      "tutor",
    },
    buftype_exclude = {
      "help",
      "nofile",
      "terminal",
      "prompt",
    },
  },
}

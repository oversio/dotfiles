
return {
  "goolord/alpha-nvim",
  config = function()
    local alpha = require "alpha"
    local dashboard = require "alpha.themes.dashboard"

    dashboard.section.header.val = {
      "░███████╗░  ████╗░░░████╗  ░███████╗░",
      "███╔══███╗  █████╗░█████║  ███╔══███╗",
      "███║░░███║  ███╔████╔███║  █████████║",
      "███║░░███║  ███║╚██╔╝███║  ███╔══███║",
      "╚███████╔╝  ███║░╚═╝░███║  ███║░░███║",
      "░╚══════╝░  ╚═╝░░░░░░░╚═╝  ╚═╝░░░░╚═╝",
    }

    -- Botones con los iconos exactos de la imagen
    dashboard.section.buttons.val = {
      dashboard.button("n", "New File", ":ene <BAR> startinsert <CR>"),
      dashboard.button("f", "  Find File", ":Telescope find_files <CR>"),
      dashboard.button("o", "  Recent Files", ":Telescope oldfiles <CR>"),
      dashboard.button("w", "󰊄  Find Word", ":Telescope live_grep <CR>"),
      dashboard.button("'", "  Bookmarks", ":Telescope marks <CR>"),
      dashboard.button("s", "  Last Session", ":SessionLoad <CR>"),
      dashboard.button("c", "  Configuration", ":e $MYVIMRC <CR>"),
      dashboard.button("u", "  Update Plugins", ":Lazy update<CR>"),
      dashboard.button("q", "  Quit", ":qa<CR>"),
    }
    -- Función para mostrar los plugins cargados
    local function footer()
      local stats = require("lazy").stats()
      local ms = (math.floor((stats.startuptime or 0) * 100 + 0.5) / 100)
      local count = stats.count or 0
      local total = stats.total or count

      return "  Neovim loaded " .. count .. (total > 0 and ("/" .. total) or "") .. " plugins in " .. ms .. "ms"
    end
    -- Random quotes feature
    local quotes = {
      "Clean code always looks like it was written by someone who cares.",
      "If debugging is the process of removing bugs, then programming must be the process of putting them in.",
      "Always code as if the person who will maintain your code is a violent psychopath who knows where you live.",
      "Any code of your own that you haven't looked at for six or more months might as well have been written by someone else.",
      "Simplicity is prerequisite for reliability.",
      "The best code is no code at all.",
      "The most important property of a program is whether it accomplishes the intention of its user.",
      "Programming today is a race between software engineers striving to build bigger and better idiot-proof programs, and the universe trying to produce bigger and better idiots. So far, the universe is winning.",
      "First, solve the problem. Then, write the code.",
      "Make it work, make it right, make it fast.",
    }

    -- Function to add padding to a quote
    local function format_quote(quote)
      local result = { "" } -- Empieza con una línea vacía para separación
      local max_line_length = 50
      local words = {}

      -- Dividir la cita en palabras
      for word in quote:gmatch "%S+" do
        table.insert(words, word)
      end

      local current_line = ""
      for _, word in ipairs(words) do
        if #current_line + #word + 1 > max_line_length then
          table.insert(result, "    " .. current_line) -- 4 espacios de padding izquierdo
          current_line = word
        else
          if current_line == "" then
            current_line = word
          else
            current_line = current_line .. " " .. word
          end
        end
      end

      if current_line ~= "" then
        table.insert(result, "    " .. current_line) -- 4 espacios de padding izquierdo
      end

      table.insert(result, "") -- Termina con una línea vacía para separación
      return result
    end
    local selected_quote = quotes[math.random(#quotes)]

    -- System information display
    local function system_info()
      return "System: "
        .. vim.loop.os_uname().sysname
        .. " | Neovim v"
        .. vim.version().major
        .. "."
        .. vim.version().minor
        .. "."
        .. vim.version().patch
    end

    dashboard.section.footer.val = footer()
    dashboard.section.footer.opts.hl = "String"
    dashboard.section.quote = {
      type = "text",
      val = format_quote(selected_quote),
      opts = {
        position = "center",
        hl = "Comment",
      },
    }
    dashboard.section.system = {
      type = "text",
      val = system_info(),
      opts = {
        position = "center",
        hl = "Comment",
      },
    }

    -- Layout configuration with all sections
    dashboard.config.layout = {
      { type = "padding", val = 2 },
      dashboard.section.header,
      { type = "padding", val = 2 },
      dashboard.section.buttons,
      { type = "padding", val = 1 },
      dashboard.section.footer,
      { type = "padding", val = 1 },
      dashboard.section.system,
      { type = "padding", val = 2 },
      dashboard.section.quote,
    }

    -- Apply the configuration
    alpha.setup(dashboard.opts)
  end,
}

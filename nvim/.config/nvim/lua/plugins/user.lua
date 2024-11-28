-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {
  {
    "AndreM222/copilot-lualine",
    config = function()
      local lualine = require "lualine"

      lualine.setup {
        options = {
          icons_enabled = true,
          -- theme = "palenight",
          theme = "horizon",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = {},
          always_divide_middle = true,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = {
            "branch",
            "diff",
            {
              "diagnostics",
              sources = { "nvim_diagnostic" },
              symbols = { error = " ", warn = " ", info = " ", hint = " " },
            },
          },
          lualine_c = { "selectioncount" },
          lualine_x = {
            {
              "copilot",
              -- Default values
              symbols = {
                status = {
                  icons = {
                    enabled = " ",
                    sleep = " ", -- auto-trigger disabled
                    disabled = " ",
                    warning = " ",
                    unknown = " ",
                  },
                  hl = {
                    enabled = "#50FA7B",
                    sleep = "#AEB7D0",
                    disabled = "#6272A4",
                    warning = "#FFB86C",
                    unknown = "#FF5555",
                  },
                },
                spinners = require("copilot-lualine.spinners").dots,
                spinner_color = "#6272A4",
              },
              show_colors = false,
              show_loading = true,
            },
            "searchcount",
            "fileformat",
            "filetype",
          },
          lualine_y = { "progress" },
          lualine_z = { "buffers" },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        extensions = {},
      }
    end,
  },
  {
    "echasnovski/mini.bufremove",
    version = "*",
    opts = function() require("mini.bufremove").setup() end,
  },
  {
    "kylechui/nvim-surround",
    event = { "BufReadPre", "BufNewFile" },
    verion = "*",
    config = true,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        position = "right",
      },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@type ibl.config
    opts = {
      scope = {
        enabled = true,
        show_start = true,
        show_end = true,
        -- show_exact_scope = true,
      },
      indent = {
        char = "│",
        -- highlight = {
        -- "RainbowRed",
        -- "RainbowYellow",
        -- "RainbowBlue",
        -- "RainbowOrange",
        -- "RainbowGreen",
        -- "RainbowViolet",
        -- "RainbowCyan",
        -- },
      },
      exclude = {
        filetypes = { "help", "alpha", "dashboard", "Trouble", "lazy", "neo-tree" },
      },
    },
    -- config = function()
    -- local hooks = require "ibl.hooks"
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    -- hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    -- vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    -- vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    -- vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    -- vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    -- vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    -- vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    -- vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
    -- end)
    -- end,
  },

  -- == Examples of Adding Plugins ==

  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function() require("lsp_signature").setup() end,
  -- },

  -- == Examples of Overriding Plugins ==

  -- customize alpha options
  -- {
  --   "goolord/alpha-nvim",
  --   opts = function(_, opts)
  --     -- customize the dashboard header
  --     opts.section.header.val = {
  --       " █████  ███████ ████████ ██████   ██████",
  --       "██   ██ ██         ██    ██   ██ ██    ██",
  --       "███████ ███████    ██    ██████  ██    ██",
  --       "██   ██      ██    ██    ██   ██ ██    ██",
  --       "██   ██ ███████    ██    ██   ██  ██████",
  --       " ",
  --       "    ███    ██ ██    ██ ██ ███    ███",
  --       "    ████   ██ ██    ██ ██ ████  ████",
  --       "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
  --       "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
  --       "    ██   ████   ████   ██ ██      ██",
  --     }
  --     return opts
  --   end,
  -- },

  -- -- You can disable default plugins as follows:
  {
    "rebelot/heirline.nvim",
    config = function()
      require("heirline").setup {
        tabline = {
          enabled = false,
        },
      }
    end,
  },
  --
  -- -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  -- {
  --   "L3MON4D3/LuaSnip",
  --   config = function(plugin, opts)
  --     require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- add more custom luasnip configuration such as filetype extend or custom snippets
  --     local luasnip = require "luasnip"
  --     luasnip.filetype_extend("javascript", { "javascriptreact" })
  --   end,
  -- },

  -- {
  --   "windwp/nvim-autopairs",
  --   config = function(plugin, opts)
  --     require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- add more custom autopairs configuration such as custom rules
  --     local npairs = require "nvim-autopairs"
  --     local Rule = require "nvim-autopairs.rule"
  --     local cond = require "nvim-autopairs.conds"
  --     npairs.add_rules(
  --       {
  --         Rule("$", "$", { "tex", "latex" })
  --           -- don't add a pair if the next character is %
  --           :with_pair(cond.not_after_regex "%%")
  --           -- don't add a pair if  the previous character is xxx
  --           :with_pair(
  --             cond.not_before_regex("xxx", 3)
  --           )
  --           -- don't move right when repeat character
  --           :with_move(cond.none())
  --           -- don't delete if the next character is xx
  --           :with_del(cond.not_after_regex "xx")
  --           -- disable adding a newline when you press <cr>
  --           :with_cr(cond.none()),
  --       },
  --       -- disable for .vim files, but it work for another filetypes
  --       Rule("a", "a", "-vim")
  --     )
  --   end,
  -- },
}

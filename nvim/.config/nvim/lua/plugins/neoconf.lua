-- Neoconf: Project-specific configuration
-- Similar to .vscode/settings.json but for Neovim

---@type LazySpec
return {
  {
    "folke/neoconf.nvim",
    cmd = "Neoconf",
    priority = 1000, -- Load before LSP
    opts = {
      -- Import settings from other sources
      import = {
        vscode = true, -- import from .vscode/settings.json
        coc = false, -- import from coc-settings.json
        nlsp = false, -- import from nlsp-settings.nvim
      },
      -- Local configuration files
      local_settings = ".neoconf.json", -- project config file
      global_settings = "neoconf.json", -- global config file
      -- Live reload
      live_reload = true,
      -- Export format for configs
      filetype_jsonc = true,
      -- Plugins that can have specific configurations
      plugins = {
        lspconfig = {
          enabled = true,
        },
        jsonls = {
          enabled = true,
          configured_servers_only = false,
        },
        lua_ls = {
          enabled_for_neovim_config = true,
        },
      },
    },
  },
  {
    -- Integration with AstroLSP
    "AstroNvim/astrolsp",
    optional = true,
    opts = function(_, opts)
      -- Wrap LSP configurations with neoconf
      local neoconf_available, neoconf = pcall(require, "neoconf")
      if neoconf_available then
        -- If neoconf is available, wrap the configuration
        if not opts.config then opts.config = {} end

        -- Store original configuration
        local original_config = vim.deepcopy(opts.config)

        -- For each server, merge with neoconf
        opts.config = setmetatable({}, {
          __index = function(t, server_name)
            local neoconf_config = neoconf.get(server_name)
            local base_config = original_config[server_name] or {}

            -- Merge configs: neoconf overrides base
            return vim.tbl_deep_extend("force", base_config, neoconf_config or {})
          end,
        })
      end
      return opts
    end,
  },
}

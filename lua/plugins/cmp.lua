-- blink.cmp => https://github.com/Saghen/blink.cmp
-- this plugin is awesome and fast but it is in BETA and it is lacking features
-- this will be a good replacement for nvim-cmp

return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
      }
      -- Disables ghost text
      opts.experimental = {
        -- ghost_text = false,
      }
      return opts
    end,
  },
  {
    "saghen/blink.cmp",
    enabled = false,
    opts = {
      windows = {
        autocomplete = {
          border = "rounded",
        },
        documentation = {
          border = "rounded",
          max_height = 50,
          auto_show_delay_ms = 250,
        },
        signature_help = {
          border = "rounded",
        },
        ghost_text = {
          enabled = false,
        },
      },
    },
  },
}

-- blink.cmp => https://github.com/Saghen/blink.cmp
-- this plugin is awesome and fast but it is in BETA and it is lacking features
-- this will be a good replacement for nvim-cmp

return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require("cmp")
    opts.window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    }
    -- Disables ghost text
    opts.experimental = {
      -- ghost_text = false,
    }
    return opts
  end,
}

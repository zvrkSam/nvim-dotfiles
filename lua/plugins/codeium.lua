return {
  {
    "Exafunction/codeium.vim",
    lazy = false,
    init = function()
      vim.g.codeium_filetypes = {
        TelescopePrompt = false,
        ["neo-tree-popup"] = false,
        ["dap-repl"] = false,
        ["markdown"] = false,
      }
    end,
    config = function()
      -- Change '<C-g>' here to any keycode you like.
      vim.keymap.set("i", "<C-w>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<C-]>", function()
        return vim.fn["codeium#CycleCompletions"](1)
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<C-}>", function()
        return vim.fn["codeium#CycleCompletions"](-1)
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<C-z>", function()
        return vim.fn["codeium#Clear"]()
      end, { expr = true, silent = true })

      -- Codeium is disabled by default on startup --
      vim.cmd("silent! CodeiumDisable")
    end,
  },
}

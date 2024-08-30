return {
  -- All tags not just html ones
  {
    "windwp/nvim-ts-autotag",
    -- enabled = false,
    spec = function()
      require("nvim-ts-autotag").setup({})
    end,
  },
  -- Don't know why this is here but im keeping it
  {
    "windwp/nvim-autopairs",
  },
}

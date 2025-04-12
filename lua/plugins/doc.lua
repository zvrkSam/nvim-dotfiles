-- These are python docs for future reference
-- https://github.com/fredrikaverpil/pydoc.nvim

-- Golang docs in neovim
return {
  {
    "jeangiraldoo/codedocs.nvim", -- Insert document strings
  },
  {
    "fredrikaverpil/godoc.nvim", -- Golang documentation
    version = "*",
    event = "VeryLazy",
    build = "go install github.com/lotusirous/gostdsym/stdsym@latest",
    cmd = { "GoDoc" },
    opts = {
      picker = {
        type = "snacks",
      },
    },
  },
  {
    "fredrikaverpil/pydoc.nvim", -- Python documentation
    event = "VeryLazy",
    cmd = { "PyDoc" },
    opts = {
      picker = {
        type = "snacks",
      },
    },
  },
}

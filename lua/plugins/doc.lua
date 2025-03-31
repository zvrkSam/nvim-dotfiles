-- These are python docs for future reference
-- https://github.com/fredrikaverpil/pydoc.nvim

-- Golang docs in neovim
return {
  {
    "fredrikaverpil/godoc.nvim",
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
    "fredrikaverpil/pydoc.nvim",
    event = "VeryLazy",
    cmd = { "PyDoc" },
    opts = {
      picker = {
        type = "snacks",
      },
    },
  },
}

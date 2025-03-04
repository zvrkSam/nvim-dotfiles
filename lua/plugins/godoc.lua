-- These are python docs for future reference
-- https://github.com/fredrikaverpil/pydoc.nvim

-- Golang docs in neovim
return {
  "fredrikaverpil/godoc.nvim",
  version = "*",
  build = "go install github.com/lotusirous/gostdsym/stdsym@latest",
  cmd = { "GoDoc" },
  opts = {
    picker = {
      type = "snacks",
    },
  },
}

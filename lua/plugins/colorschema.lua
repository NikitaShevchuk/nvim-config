return {
  { "Mofiqul/vscode.nvim", name = "vscode", lazy = false, priority = 1000 },
  { "marko-cerovac/material.nvim", name = "material", lazy = true },
  { "rose-pine/neovim", lazy = true, name = "rose-pine" },
  { "0xstepit/flow.nvim", lazy = true, name = "flow" },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vscode",
    },
  },
}

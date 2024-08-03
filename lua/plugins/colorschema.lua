return {
  { "Mofiqul/vscode.nvim", name = "vscode", lazy = true },
  { "marko-cerovac/material.nvim", name = "material", lazy = true },
  { "rose-pine/neovim", lazy = false, name = "rose-pine", priority = 1000 },
  { "folke/tokyonight.nvim", name = "tokyonight", llazy = true },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine",
    },
  },
}

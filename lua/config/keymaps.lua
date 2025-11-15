-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here


local neogit = require("neogit")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Negit keymap
vim.keymap.set("n", "<leader>gS", neogit.open)
vim.keymap.set("n", "<leader>gl", ":Neogit log<CR>")
vim.keymap.set("n", "<leader>gb", ":Telescope git_branches<CR>")

-- Paste without copying the previous value to register
-- vim.keymap.set("v", "p", '"_dp', { desc = "Paste without copying" })
-- vim.keymap.set("v", "P", '"_dp', { desc = "Paste without copying" })
-- Lua function to jump to the next capital letter
local function jump_to_next_capital()
  -- Search for the next uppercase letter
  vim.fn.search("\\u", "W")
end

-- Mapping the function to a key
vim.keymap.set("n", "<leader>k", jump_to_next_capital, { desc = "Jump to next capital letter" })
vim.keymap.set("v", "<leader>k", jump_to_next_capital, { desc = "Jump to next capital letter" })

-- Lua function to jump to the previous capital letter
local function jump_to_prev_capital()
  -- Search for the previous uppercase letter
  vim.fn.search("\\u", "bW")
end

-- Mapping the function to a key
vim.keymap.set("n", "<leader>j", jump_to_prev_capital, { desc = "Jump to previous capital letter" })
vim.keymap.set("v", "<leader>j", jump_to_prev_capital, { desc = "Jump to previous capital letter" })

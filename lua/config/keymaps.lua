-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Reopen the LazyVim/Snacks dashboard (home screen) even with files open,
-- so you can jump to a different project without quitting Neovim
vim.keymap.set("n", "<leader>fd", function()
  Snacks.dashboard.open()
end, { desc = "Open Dashboard" })

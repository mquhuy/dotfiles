-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Oil edit" })
vim.keymap.set({ 'n' }, '<Leader>te', function()
  vim.cmd('tabedit %')
end, { silent = true, noremap = true, desc = '[T]ab [E]dit' })

vim.keymap.set({ 'n' }, 'tx', function()
  vim.cmd('tabclose')
end, { silent = true, noremap = true, desc = '[T]ab [x]Close' })

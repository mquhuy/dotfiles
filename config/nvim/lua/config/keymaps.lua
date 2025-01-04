-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Oil edit" })
vim.keymap.set("n", "<leader>fw", require("telescope.builtin").grep_string, { desc = "[F]ind current [W]ord" })
vim.keymap.del("n", "<leader>fg")
vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, { desc = "[F]ind by [G]rep" })
vim.keymap.del("n", "<leader><space>")
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.del("n", "<leader>/")
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })
vim.keymap.set({ 'n' }, '<Leader>te', function()
  vim.cmd('tabedit %')
end, { silent = true, noremap = true, desc = '[T]ab [E]dit' })

vim.keymap.set({ 'n' }, 'tx', function()
  vim.cmd('tabclose')
end, { silent = true, noremap = true, desc = '[T]ab [x]Close' })

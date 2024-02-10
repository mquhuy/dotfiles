-- Custom functions
-- package.path = package.path .. ";./customs/?.lua"
-- print(package.path)
require('customs.image_paste')
vim.keymap.set('n', '<leader>pi', function()
  image_paste()
end, { desc = 'Paste [I]mage' })

-- Reload configuration
vim.keymap.set('n', '<leader>rc', function()
  reload_config('customs.init')
end, { desc = 'Reload [C]ustoms configuration' })

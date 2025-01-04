-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- Disable formatting for shell files
vim.g.autoformat = false -- Disable autoformatting globally

-- Or to disable only for shell files
local format_disabled_dirs = {
  filetype = { "sh", "bash" },
}
vim.g.autoformat_disabled = format_disabled_dirs

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    -- "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    -- "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader` NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.clipboard = 'unnamedplus'
vim.opt.conceallevel = 1

-- Set clipboard
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Press Y in 'v' mode to copy to clipboard
map('v', 'Y', '"+y')

require('lazy').setup('plugins')

-- empty setup nvim-tree using defaults
require("nvim-tree").setup()

vim.g.nvim_tree_respect_buf_cwd = 1,

-- Keymap
vim.keymap.set({ 'n' }, '<Leader>ft', function()
  vim.cmd('NvimTreeToggle')
end, { silent = true, noremap = true, desc = 'Run [G]ithub [Source]' })


-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.statuscolumn = "%l  %r"

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme
-- vim.o.termguicolors = true
-- vim.cmd [[colorscheme nordfox]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })


local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Some user-defined commands
vim.keymap.set({ 'n' }, '<Leader>dt', function()
  local fileAbsPath = vim.api.nvim_buf_get_name(0)
  local cmd = 'doctoc ' .. fileAbsPath
  vim.fn.system(cmd)
  vim.cmd(':e')
end, { silent = true, noremap = true, desc = "run doctoc on current file" })

-- vim.keymap.set({ 'n' }, '<leader>gs', function()
--   local line = vim.api.nvim_win_get_cursor(0)[1]
--   local fileAbsPath = vim.api.nvim_buf_get_name(0)
--   local cmd = 'ghsource ' .. fileAbsPath .. " " .. line
--   local result = vim.fn.system(cmd)
--   vim.notify(result)
-- end, { silent = true, noremap = true, desc = "Run [G]it [S]ource" })

vim.keymap.set({ 'n' }, '<Leader>gs', function()
  vim.cmd('GBrowse')
end, { silent = true, noremap = true, desc = 'Run [G]ithub [Source]' })

vim.keymap.set({ 'n' }, '<Leader>te', function()
  vim.cmd('tabedit %')
end, { silent = true, noremap = true, desc = '[T]ab [E]dit' })

vim.keymap.set({ 'n' }, 'tx', function()
  vim.cmd('tabclose')
end, { silent = true, noremap = true, desc = '[T]ab [x]Close' })

vim.keymap.set({ 'n' }, '<C-s>', function()
  vim.cmd(':w')
end, { silent = false, noremap = true, desc = '[S]ave' })

-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
--
-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[F]ind [F]iles', noremap = true })
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = '[F]ind [H]elp' })
vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = '[F]ind current [W]ord' })
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = '[F]ind by [G]rep' })
vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = '[F]ind [D]iagnostics' })
vim.keymap.set('n', "<leader>fC", function()
  require("telescope").extensions.diff.diff_files({ hidden = true })
end, { desc = "[F]ile [C]ompare" })
vim.keymap.set('n', "<leader>fc", function()
  require("telescope").extensions.diff.diff_current({ hidden = true })
end, { desc = "[F]ile Compare file with [c]urrent" })

vim.keymap.set("n", "<leader>m", function()
  require("telescope").extensions.monorepo.monorepo()
end)
vim.keymap.set("n", "<leader>n", function()
  require("monorepo").toggle_project()
end)

-- Reload config
function reload_config(config)
  package.loaded[config] = nil
  require(config)
end

-- Customs
require('customs.init')

vim.opt.conceallevel = 1

-- Example for configuring Neovim to load user-installed installed Lua rocks:
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"

require("image").setup({
  backend = "kitty",
  integrations = {
    markdown = {
      enabled = true,
      clear_in_insert_mode = false,
      download_remote_images = true,
      only_render_image_at_cursor = false,
      filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
    },
    neorg = {
      enabled = true,
      clear_in_insert_mode = false,
      download_remote_images = true,
      only_render_image_at_cursor = false,
      filetypes = { "norg" },
    },
  },
  max_width = nil,
  max_height = nil,
  max_width_window_percentage = nil,
  max_height_window_percentage = 50,
  window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
  window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
  editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
  tmux_show_only_in_active_window = false, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
  hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" }, -- render image files as images when opened
})

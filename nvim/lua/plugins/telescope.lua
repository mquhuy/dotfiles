return {
  -- Fuzzy Finder (files, lsp, etc)
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    {'<leader>ff', require('telescope.builtin').find_files, { desc = '[F]ind [F]iles' }},
    {'<leader>fh', require('telescope.builtin').help_tags, { desc = '[F]ind [H]elp' }},
    {'<leader>fw', require('telescope.builtin').grep_string, { desc = '[F]ind current [W]ord' }},
    {'<leader>fg', require('telescope.builtin').live_grep, { desc = '[F]ind by [G]rep' }},
    {'<leader>fd', require('telescope.builtin').diagnostics, { desc = '[F]ind [D]iagnostics' }},
    {'<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' }},
    {'<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' }},
-- See `:help telescope.builtin`
    {'<leader>/', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
      require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
      end, { desc = '[/] Fuzzily search in current buffer]' }},
  },
  config = function()
    -- [[ Configure Telescope ]]
    -- See `:help telescope` and `:help telescope.setup()`
    require('telescope').setup {
      defaults = {
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
          },
          n = {
            ['d'] = 'delete_buffer',
          },
        },
      },
    }
  end
}
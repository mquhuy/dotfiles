return {
  -- Autocompletion
  -- {
  --   'hrsh7th/nvim-cmp',
  --   dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  -- },

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'lewis6991/gitsigns.nvim',

  'lukas-reineke/indent-blankline.nvim', -- Add indentation guides even on blank lines
  'numToStr/Comment.nvim',               -- "gc" to comment visual regions/lines
  'tpope/vim-sleuth',                    -- Detect tabstop and shiftwidth automatically
  --Magit
  -- 'jreybert/vimagit',

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', cond = vim.fn.executable 'make' == 1 },

  --tmux
  'aserowy/tmux.nvim',

  -- Pairs
  { 'echasnovski/mini.pairs', version = '*' },

  -- Nvim tree
  "nvim-tree/nvim-tree.lua",

}

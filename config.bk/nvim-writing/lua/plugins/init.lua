return {
  'lukas-reineke/indent-blankline.nvim', -- Add indentation guides even on blank lines
  'tpope/vim-sleuth',                    -- Detect tabstop and shiftwidth automatically
  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', cond = vim.fn.executable 'make' == 1 },

  -- Pairs
  { 'echasnovski/mini.pairs', version = '*' },

  -- Nvim tree
  "nvim-tree/nvim-tree.lua",

  -- Markdown headlines
  "AntonVanAssche/md-headers.nvim",
}

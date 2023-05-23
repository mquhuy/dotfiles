return {
  'ray-x/navigator.lua',
  dependencies = {
    { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
    { 'neovim/nvim-lspconfig' },
    { 'nvim-treesitter/nvim-treesitter' },
  },
  opts = {
    keymaps = {
      { key = '<Space>ss', func = vim.lsp.buf.format, mode = 'n', desc = 'format' },
    }
  },
}

return {
  'ray-x/navigator.lua',
  dependencies = {
    { 'neovim/nvim-lspconfig' },
    { 'ray-x/guihua.lua',                        build = "cd lua/fzy && make" },
    { 'nvim-treesitter/nvim-treesitter' },
    { 'nvim-treesitter/nvim-treesitter-refactor' },
    { "ray-x/lsp_signature.nvim" },
    { "ray-x/go.nvim" },
  },
  opts = {
    keymaps = {
      { key = '<Space>ss', func = vim.lsp.buf.format, mode = 'n', desc = 'format' },
    },
    treesitter_analysis = true,
    treesitter_navigation = true,
    lsp = {
      enable = true,
      format_on_save = true,
    },
  },
}

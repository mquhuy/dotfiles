return {
  'phaazon/mind.nvim',
  branch = 'v2.2',
  dependancies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require'mind'.setup()
  end
}

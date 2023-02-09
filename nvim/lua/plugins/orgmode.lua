return {
    'nvim-orgmode/orgmode',
    dependancies = {
        'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('orgmode').setup_ts_grammar()
      require('orgmode').setup{}
    end
}

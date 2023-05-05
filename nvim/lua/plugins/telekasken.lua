return   {
    'renerocksai/telekasten.nvim',
    event = "VeryLazy",
    config = function ()
      require('telekasten').setup({
        home = vim.fn.expand("~/Repos/zettelkasten"),
      })
    end,
    keys = {
      { "<leader>z", "<cmd>Telekasten panel<CR>" },
      { "<leader>zf", "<cmd>Telekasten find_notes<CR>" },
      { "<leader>zg", "<cmd>Telekasten search_notes<CR>" },
      { "<leader>zd", "<cmd>Telekasten goto_today<CR>" },
      { "<leader>zz", "<cmd>Telekasten follow_link<CR>" },
      { "<leader>zn", "<cmd>Telekasten new_note<CR>" },
      { "<leader>zc", "<cmd>Telekasten show_calendar<CR>" },
      { "<leader>zb", "<cmd>Telekasten show_backlinks<CR>" },
      { "<leader>zI", "<cmd>Telekasten insert_img_link<CR>" },
      { "[[", "<cmd>Telekasten insert_link<CR>", mode = "i" },
    },
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'nvim-telescope/telescope-media-files.nvim',
      'renerocksai/calendar-vim',
    },
}

return {
  'toppair/peek.nvim',
  lazy = true,
  build = function()
     os.execute("deno task build:fast")
  end,
  opts = {
    filetype = { 'markdown', 'telekasten' },
    theme = 'light',
  },
  keys = {
    {"<leader>p", function()
     local peek = require('peek')
     if not peek.is_open() then
       vim.fn.system('i3-msg split horizontal')
       peek.open()
     else
      peek.close()
     end
    end
    },
  }
}

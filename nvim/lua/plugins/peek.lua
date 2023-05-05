return {
  'toppair/peek.nvim',
  lazy = true,
  init = function ()
    os.execute('deno task --quiet build:fast')
  end,
  opts = {
    filetype = { 'markdown', 'telekasten' },
  },
}

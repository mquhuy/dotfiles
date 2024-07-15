return {
 'cnshsliu/smp.nvim',
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "MunifTanjim/nui.nvim",
  },
  enabled = false,
  opts = {
    home = vim.fn.expand("~/Repos/zettelkasten")
  }
}

return {
 'cnshsliu/smp.nvim',
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    home = vim.fn.expand("~/Repos/zettelkasten")
  }
}

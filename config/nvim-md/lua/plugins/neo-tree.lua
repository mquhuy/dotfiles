return {
  "nvim-neo-tree/neo-tree.nvim",
  enabled = true,
  cmd = "Neotree",
  branch = "v3.x",
  keys = {
    { "<leader>ft", "<cmd>Neotree toggle reveal<cr>", desc = "NeoTree" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    'nvim-tree/nvim-web-devicons',
    "MunifTanjim/nui.nvim",
    "s1n7ax/nvim-window-picker",
  },
  config = function()
    filesystem = {
      follow_current_file = true,
    }
  end
}

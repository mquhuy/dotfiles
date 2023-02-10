return {
  'kdheepak/lazygit.nvim',
  keys = {
    {"<leader>gg", "<cmd>LazyGit<cr>", desc="lazygit"},
  },
  config = function ()
    lazygit_floating_window_winblend = 0 -- transparency of floating window
    lazygit_floating_window_scaling_factor = 0.9 -- scaling factor for floating window
    lazygit_floating_window_use_plenary = 0 -- use plenary.nvim to manage floating window if available
    lazygit_use_neovim_remote = 1 -- fallback to 0 if neovim-remote is not installed
    lazygit_use_custom_config_file_path = 0 -- config file path is evaluated if this value is 1
    lazygit_config_file_path = '' -- custom config file path
  end
}

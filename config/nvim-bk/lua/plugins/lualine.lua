return {
  'nvim-lualine/lualine.nvim', -- Fancier statusline
   config = function ()
        require('lualine').setup {
          options = {
            icons_enabled = false,
            theme = 'auto',
            component_separators = { left = '', right = '' },
            section_separators = { left = '', right = '' },
          },
        always_divide_middle = true,
          sections = {
            lualine_a = {
              {
                'filename',
                path = 3,
              },
            },
            lualine_b = {'branch', 'diff', 'diagnostics'},
            lualine_c = {
              {
                'buffers',
                show_filename_only = true,
                max_length = vim.o.columns * 2 / 3,
              }
            },
            lualine_x = {'encoding', 'fileformat', 'filetype'},
            lualine_y = {'progress'},
            lualine_z = {'location'}
          }
        }
   end
}

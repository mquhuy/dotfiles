function count_files(regex)
  local command = 'ls -1 ' .. regex .. ' 2>/dev/null | wc -l'
  local handle = io.popen(command)
  local result = handle:read("*a")
  handle:close()
  return tonumber(result)
end

return {
  "HakonHarnes/img-clip.nvim",
  enabled = true,
  event = "BufEnter",
  opts = {
    default = {
      dir_path = function()
        return vim.fn.expand("%:p:h") .. "/images"
      end,
      file_name = function()
        currentfile = vim.fn.expand("%:t:r")
        local image_directory = 'images'
        n_images = count_files(image_directory .. '/' .. currentfile .. '*.png')
        return currentfile .. '-' .. string.format("%04d", n_images+1)
      end,
    },
    -- add options here
    -- or leave it empty to use the default settings
  },
  keys = {
    -- suggested keymap
    { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste clipboard image" },
  },
}

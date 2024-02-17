function count_files(regex)
  local command = 'ls -1 ' .. regex .. ' 2>/dev/null | wc -l'
  local handle = io.popen(command)
  local result = handle:read("*a")
  handle:close()
  return tonumber(result)
end

function image_paste()
  filename = vim.fn.expand('%:t:r')
  if filename == '' then
    print('No file name')
    return
  end
  local image_directory = 'images'
  local exists = os.execute("cd " .. image_directory)
  if exists == nil or exists == false then
      os.execute("mkdir -p " .. image_directory)
  end
  n_images = count_files(image_directory .. '/' .. filename .. '*.png')
  local image_name = image_directory .. '/' .. filename .. '-' .. string.format("%04d", n_images+1) .. '.png'
  -- local success, result = pcall(vim.cmd, '!xclip -select clipboard -t image/png -o > ' .. image_name)
  local exitcode = os.execute('xclip -select clipboard -t image/png 2>/dev/null -o > ' .. image_name)
  print(exitcode)
  if exitcode == 0 then
    vim.api.nvim_put({'.image ' .. image_name}, 'l', true, true)
  else
    print('Error: Check your clipboard content.')
    os.execute('rm ' .. image_name)
  end
end

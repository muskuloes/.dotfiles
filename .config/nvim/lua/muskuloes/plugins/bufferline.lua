return function()
  local ok, bufferline = pcall(require, "bufferline")

  if not ok then
    return
  end

  bufferline.setup {
    options = {
      mode = 'tabs',
      separator_style = "thick",
      always_show_bufferline = false,
      show_buffer_close_icons = false,
      color_icons = true,
    }
  }

end

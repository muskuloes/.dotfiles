return function()
  local ok, gruvbox = pcall(require, "gruvbox")

  if not ok then
    return
  end

  gruvbox.setup { overrides = { italic = false, invert_tabline = true } }
end

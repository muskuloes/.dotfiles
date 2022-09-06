return function()
  local ok, lualine = pcall(require, "lualine")

  if not ok then
    return
  end

  local config = lualine.get_config()
  lualine.setup(config)
end

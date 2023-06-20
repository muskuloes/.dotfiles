return function()
  local ok, lualine = pcall(require, "lualine")

  if not ok then
    return
  end

  -- local config = lualine.get_config()
  local config = {
    options = {
      theme = "gruvbox",
    },
    sections = {
      lualine_b = { "branch", "diff" },
    },
  }
  lualine.setup(config)
end

return function()
  local ok, alpha = pcall(require, "alpha")

  if not ok then
    return
  end

  local startify = require "alpha.themes.startify"

  alpha.setup(startify.config)
end

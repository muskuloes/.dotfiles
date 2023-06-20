return function()
  local ok, slime = pcall(require, "vim-slime")
  if not ok then
    return
  end
  slime.setup {}
end

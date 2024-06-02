return function()
  local ok, tex = pcall(require, "vimtex")

  if not ok then
    return
  end

  tex.setup {
    vimtex_view_method = { "zathura" },
  }
end

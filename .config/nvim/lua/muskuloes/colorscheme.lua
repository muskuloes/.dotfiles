local colorscheme = "gruvbox"

local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })

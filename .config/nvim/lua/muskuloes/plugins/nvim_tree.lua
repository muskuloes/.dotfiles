return function()
  local ok, nvim_tree = pcall(require, "nvim-tree")

  if not ok then
    return
  end

  nvim_tree.setup {
    disable_netrw = true,
    open_on_setup = false,
    ignore_ft_on_setup = {
      "startify",
      "alpha",
    },
    diagnostics = {
      enable = true,
    },
    update_focused_file = {
      enable = true,
    },
  }
end

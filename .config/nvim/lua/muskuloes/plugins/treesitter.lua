return function()
  local ok, ts_configs = pcall(require, "nvim-treesitter.configs")

  if not ok then
    return
  end

  ts_configs.setup {
    ensure_installed = "all",
    sync_install = false,
    ingore_install = { "" },
    autopairs = {
      enable = true,
    },
    autotag = { enable = true },
    highlight = { enable = true, disable = { "" }, additional_vim_regex_highlighting = true },
    indent = { enable = true, disable = { "yaml" } },
    context_commentstring = { enable = true },
  }
end

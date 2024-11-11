return function()
  local ok, ts_configs = pcall(require, "nvim-treesitter.configs")

  require('ts_context_commentstring').setup {} 
  vim.g.skip_ts_context_commentstring_module = true

  if not ok then
    return
  end

  ts_configs.setup {
    ensure_installed = { "javascript", "json", "lua", "markdown", "markdown_inline", "python", "r", "rnoweb", "tmux", "typescript", "yaml" },
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

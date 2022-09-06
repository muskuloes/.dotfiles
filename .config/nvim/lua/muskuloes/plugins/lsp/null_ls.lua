local M = {}

local ok, null_ls = pcall(require, "null-ls")
if not ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions= null_ls.builtins.code_actions

local  sources = {
    formatting.stylua,
    formatting.black,
    formatting.isort,
    formatting.clang_format,
    formatting.dart_format,
    formatting.styler,
    formatting.gofmt,
    formatting.rustfmt,
    formatting.yamlfmt,
    formatting.markdownlint,
    formatting.prettierd,
    diagnostics.flake8,
    diagnostics.tsc,
    diagnostics.hadolint,
    diagnostics.markdownlint,
    diagnostics.fish,
    diagnostics.yamllint,
    code_actions.gitsigns,
    code_actions.gitrebase,
  }

function M.setup(opts)
  null_ls.setup {
    sources = sources,
    -- on_attach= opts.on_attach
  }
end

return M

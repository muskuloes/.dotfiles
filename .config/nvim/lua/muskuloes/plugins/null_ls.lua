return function()
  local ok, null_ls = pcall(require, "null-ls")
  if not ok then
    return
  end

  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics
  local code_actions = null_ls.builtins.code_actions

  local sources = {
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

  local formatting_augroup = vim.api.nvim_create_augroup("LspFormatting", {})

  local on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = formatting_augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = formatting_augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.formatting()
        end,
      })
    end
  end

  null_ls.setup {
    sources = sources,
    on_attach = on_attach,
  }
end

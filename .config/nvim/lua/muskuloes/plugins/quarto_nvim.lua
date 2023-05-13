return function()
  local ok, quarto = pcall(require, "quarto")
  if not ok then
    return
  end

  quarto.setup {
    debug = false,
    closePreviewOnExit = true, -- close preview terminal on closing of qmd file buffer
    lspFeatures = {
      enabled = true,
      languages = { "r", "python", "julia", "bash" },
      chunks = "curly",
      diagnostics = {
        enabled = true, -- enable diagnostics for embedded languages
        triggers = { "BufWritePost" },
      },
      completion = {
        enabled = true,
      },
    },
    keymap = {
      hover = "K",
      definition = "gd",
    },
  }
end

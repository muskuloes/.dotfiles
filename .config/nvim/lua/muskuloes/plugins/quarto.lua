return function()
  local ok, quarto = pcall(require, "quarto")
  if not ok then
    return
  end

  quarto.setup {
    closePreviewOnExit = true, -- close preview terminal on closing of qmd file buffer
    diagnostics = {
      enabled = false, -- enable diagnostics for embedded languages
      languages = { "python", "r", "julia" },
    },
  }
end

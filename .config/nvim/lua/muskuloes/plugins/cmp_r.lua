return function()
  local cmp_r_ok, cmp_r = pcall(require, "cmp_r")

  if not cmp_r_ok then
    return
  end

  cmp_r.setup {
    filetypes = { "r", "rmd", "quarto" },
    doc_width = 58,
    quarto_intel = "~/Downloads/quarto-1.1.251/share/editor/tools/yaml/yaml-intelligence-resources.json",
  }
end
